---
name: screaming-snake-converter
description: Converts text to SCREAMING_SNAKE_CASE (uppercase with underscores). Use when renaming variables to constants, formatting environment variables, or standardizing identifiers from formats like camelCase, kebab-case, or dot.notation.
---

# Screaming Snake Converter

This skill provides a deterministic way to convert various text formats into `SCREAMING_SNAKE_CASE` using direct instructions.

## Capabilities

- Converts `camelCase` to `CAMEL_CASE`
- Converts `kebab-case` to `KEBAB_CASE`
- Converts `dot.notation` to `DOT_NOTATION`
- Converts `space separated` to `SPACE_SEPARATED`
- Ensures the output is entirely uppercase and uses underscores as separators.

## Instructions

When this skill is active, you MUST perform the conversion using the following logic:
1. Identify all separators (dots, hyphens, spaces) and transitions between lowercase and uppercase letters (camelCase).
2. Replace all separators with underscores.
3. Insert an underscore between lowercase and uppercase transitions.
4. Convert all characters to uppercase.
5. Remove any leading or trailing underscores.

## Examples

- "Convert 'myVariable' to upper underscore format" -> `MY_VARIABLE`
- "Format 'database.host_name' as a constant" -> `DATABASE_HOST_NAME`
