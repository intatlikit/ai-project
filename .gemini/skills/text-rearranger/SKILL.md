---
name: text-rearranger
description: Rearranges text format into SCREAMING_SNAKE_CASE wrapped in a function-like call. Use when converting keys like 'database.host_name' to 'DATABASE_HOST_NAME("database.host_name")'.
---

# Text Rearranger

This skill rearranges text strings (e.g., configuration keys or database fields) into a specific format: `UPPER_CASE("original.text")`.

## Capabilities

- Converts `dot.notation`, `camelCase`, and `kebab-case` to `SCREAMING_SNAKE_CASE`.
- Wraps the converted text: `SCREAMING_SNAKE_CASE("original.text")`.
- Handles multiple inputs, joining them with commas and newlines.

## Instructions

When this skill is active, you MUST perform the rearrangement using the following logic for each input:
1. **Convert to SCREAMING_SNAKE_CASE**:
   - Replace dots, hyphens, and spaces with underscores.
   - Insert underscores between camelCase transitions (e.g., `myVar` becomes `MY_VAR`).
   - Convert everything to uppercase.
   - Remove leading/trailing underscores.
2. **Wrap Output**:
   - Format the result as: `SCREAMING_SNAKE_CASE_RESULT("original_input")`.
3. **Multiple Inputs**:
   - If multiple strings are provided, join the results with a comma and a newline (`, \n`).

## Examples

- Input: `database.host_name` -> `DATABASE_HOST_NAME("database.host_name")`
- Input: `myApiKey` -> `MY_API_KEY("myApiKey")`
