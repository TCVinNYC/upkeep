FROM node:16-alpine

WORKDIR /app

# Copy package files and install dependencies, then rebuild bcrypt for the current architecture.
COPY package*.json ./
RUN npm install

# Copy the rest of the code and build the project.
COPY . .
RUN npm run build

EXPOSE 3000

# For production; docker-compose can override this with a dev command.
CMD ["npm", "run", "start:prod"]
