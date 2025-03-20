# generate-open-api.sh
#
# This script generates your Dart client SDK from your OpenAPI (Swagger) specification.
# It downloads the required Mustache templates, applies any optional patches,
# and then runs the OpenAPI Generator CLI with the --skip-validate-spec flag
# to bypass certain spec validation errors.
#
# Requirements:
# - Java 11 or later must be installed.
# - Either wget or curl must be available.
# - Your NestJS server should be running so that the spec is accessible.
#
# Note: This script is designed to be run from within the "open-api" folder.
# The generated templates and output will be relative to that directory.
#
# Customize the OPENAPI_GENERATOR_VERSION variable and the spec URL (-i parameter) as needed.

set -e

# Check that Java 11+ is installed.
JAVA_VERSION=$(java -version 2>&1 | awk -F[\".] '/version/ {print $2}')
if [ "$JAVA_VERSION" -lt 11 ]; then
  echo "Error: Java 11 or newer is required. Your version is $JAVA_VERSION."
  echo "On macOS you can install via Homebrew: brew install openjdk@11"
  exit 1
fi

# Define the OpenAPI Generator version to use.
OPENAPI_GENERATOR_VERSION="v7.8.0"

# Define the directories for our templates relative to the current directory.
TEMPLATE_DIR="./templates/mobile/serialization/native"
API_TEMPLATE_DIR="./templates/mobile"

# Function to download a file using wget or curl.
download_file() {
  local url=$1
  local output=$2
  if command -v wget >/dev/null 2>&1; then
    wget -O "$output" "$url"
  elif command -v curl >/dev/null 2>&1; then
    curl -L -o "$output" "$url"
  else
    echo "Error: Neither wget nor curl is installed." >&2
    exit 1
  fi
}

# Ensure the native templates directory exists.
if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Template directory $TEMPLATE_DIR does not exist. Creating it..."
  mkdir -p "$TEMPLATE_DIR"
fi

# Download the native_class.mustache template.
echo "Downloading native_class.mustache template..."
download_file "https://raw.githubusercontent.com/OpenAPITools/openapi-generator/$OPENAPI_GENERATOR_VERSION/modules/openapi-generator/src/main/resources/dart2/serialization/native/native_class.mustache" "$TEMPLATE_DIR/native_class.mustache"

# Optional: Apply a patch for native_class.mustache if available.
if [ -f "./templates/mobile/serialization/native/native_class.mustache.patch" ]; then
  echo "Patching native_class.mustache template..."
  patch --no-backup-if-mismatch -u "$TEMPLATE_DIR/native_class.mustache" < "./templates/mobile/serialization/native/native_class.mustache.patch"
fi

# Ensure the API template directory exists.
if [ ! -d "$API_TEMPLATE_DIR" ]; then
  echo "API template directory $API_TEMPLATE_DIR does not exist. Creating it..."
  mkdir -p "$API_TEMPLATE_DIR"
fi

# Download the api.mustache template.
echo "Downloading api.mustache template..."
download_file "https://raw.githubusercontent.com/OpenAPITools/openapi-generator/$OPENAPI_GENERATOR_VERSION/modules/openapi-generator/src/main/resources/dart2/api.mustache" "$API_TEMPLATE_DIR/api.mustache"

# Optional: Apply a patch for api.mustache if available.
if [ -f "./templates/mobile/api.mustache.patch" ]; then
  echo "Patching api.mustache template..."
  patch --no-backup-if-mismatch -u "$API_TEMPLATE_DIR/api.mustache" < "./templates/mobile/api.mustache.patch"
fi

# IMPORTANT: Do NOT change directory here.
# Run the OpenAPI generator using npx with --skip-validate-spec to bypass validation errors.
echo "Running OpenAPI generator CLI..."
npx --yes @openapitools/openapi-generator-cli generate \
    -g dart \
    -i http://localhost:3000/api-json \
    -o ../mobile/openapi \
    -t templates/mobile \
    --skip-validate-spec

# Optional: Apply post-generation patches if patch files are available.
if [ -f "../patch/api_client.dart.patch" ]; then
  echo "Patching generated api_client.dart..."
  patch --no-backup-if-mismatch -u ../mobile/openapi/lib/api_client.dart < ../patch/api_client.dart.patch
fi

if [ -f "../patch/api.dart.patch" ]; then
  echo "Patching generated api.dart..."
  patch --no-backup-if-mismatch -u ../mobile/openapi/lib/api.dart < ../patch/api.dart.patch
fi

if [ -f "../patch/pubspec_mobile.yaml.patch" ]; then
  echo "Patching generated pubspec.yaml..."
  patch --no-backup-if-mismatch -u ../mobile/openapi/pubspec.yaml < ../patch/pubspec_mobile.yaml.patch
fi

# Remove generated analysis_options.yaml file to avoid conflicts.
if [ -f "../mobile/openapi/analysis_options.yaml" ]; then
  echo "Removing generated analysis_options.yaml..."
  rm ../mobile/openapi/analysis_options.yaml
fi

echo "Dart client SDK generated successfully in ../mobile/openapi."
