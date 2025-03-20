import { applyDecorators } from '@nestjs/common';
import { IsOptional, IsBoolean } from 'class-validator';
import sanitize from 'sanitize-filename';

/**
 * Optional decorator.
 */
export function Optional(options?: { nullable?: boolean }): PropertyDecorator {
  return applyDecorators(IsOptional());
}

/**
 * toEmail transformer.
 * Converts an input string to lowercase and trims whitespace.
 */
export function toEmail({ value }: { value: any }): any {
  if (typeof value === 'string') {
    return value.toLowerCase().trim();
  }
  return value;
}

/**
 * toSanitized transformer.
 * Sanitizes a string (e.g. for filenames) by removing disallowed characters.
 */
export function toSanitized(value: any): any {
  if (typeof value === 'string') {
    return sanitize(value);
  }
  return value;
}

/**
 * ValidateBoolean decorator.
 * Ensures the property is a boolean.
 */
export function ValidateBoolean(options?: {
  optional?: boolean;
}): PropertyDecorator {
  const decorators = [];
  if (options?.optional) {
    decorators.push(IsOptional());
  }
  decorators.push(IsBoolean());
  return applyDecorators(...decorators);
}
