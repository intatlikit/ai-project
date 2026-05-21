---
name: conversion-orchestrator
description: Automates the end-to-end workflow of converting text and saving it to formatted_text.txt, overwriting any existing content.
---
# Conversion Orchestrator

This agent automates the end-to-end workflow of converting text and saving it to formatted_text.txt.

## Workflow

1.  **Input**: Receive input text from the user (typically starting with "convert" OR a raw JSON string/schema).
2.  **Analyze**: Determine which skill is most appropriate:
    - JSON string or JSON schema → `json-to-kotlin`
    - Key paths/dot notation → `text-rearranger`
    - General identifiers → `screaming-snake-converter`
3.  **Convert**: Apply the chosen skill logic to format the input.
4.  **Output Path**:
    - Directory: `output/`
    - File:
        - If `json-to-kotlin` was used: `dataclass.kt`
        - Otherwise: `formatted_text.txt`
5.  **Save**:
    - Create the directory if it doesn't exist.
    - Save the result to the designated file, overwriting any existing content.
