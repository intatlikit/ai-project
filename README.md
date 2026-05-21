# AI Agent Project: Text Transformation & Automated Documentation

Welcome to the **AI Agent Project** workspace! This is a specialized environment designed for high-performance text transformation, data model conversion, and automated documentation generation.

## 🚀 Core Features

### Agents & Orchestration
- **Conversion Orchestrator**: Automates end-to-end workflows, intelligently routing inputs to specialized skills for JSON conversion or text formatting.

### Specialized Skills
- **JSON to Kotlin Data Class Conversion**: Transforms JSON payloads into production-ready Kotlin data classes with GSON serialization.
- **Commit Message Analysis**: Automatically generates high-quality, conventional commit messages based on staged changes.
- **Text Standardizers**: Tools for `SCREAMING_SNAKE_CASE` conversion and specialized text rearrangement.

---

## 📂 Repository Structure

```
├── .gemini/               # Agent definitions, specialized skills, and MCP settings
├── bin/                   # Utility and optimized pipeline scripts
│   └── push-to-main.sh    # Optimized atomic Git push pipeline script
├── output/                # Directory containing all generated artifacts
│   ├── confluence_request_analysis.txt
│   ├── dataclass.kt
│   └── formatted_text.txt
├── GEMINI.md              # Project guidelines, safety protocols, and engineering standards
├── README.md              # Main project documentation (this file)
└── .gitignore             # Configured Git ignore rules
```

---

## ⚡ Optimized Atomic Push Pipeline

We use an optimized CLI script designed for speed and atomic commit history. It supports one-by-one staging and automated conventional commit suggestions.

**To start the pipeline:**
```bash
./bin/push-to-main.sh
```

### Safety Protocols
- **Atomic Commits**: The script encourages staging specific files to keep commits granular and logical.
- **User-Initiated Push Only**: In accordance with our safety standards, the AI Agent will NEVER proactively push to the `main` branch. All pushes must be explicitly commanded by the user.

---

## 🛠️ Generated Artifacts in `output/`

*   **API Analysis**: Structured documentation ready for Confluence or internal wikis.
*   **Data Models**: idiomatic Kotlin data classes for complex JSON responses.
*   **Formatted Text**: Annotated class structures and code usage guidelines.

---

## ⚙️ Development Standards

*   **Output Integrity**: All generated artifacts MUST be saved within the `output/` directory.
*   **Engineering Rules**: The AI Agent strictly adheres to the standards defined in `GEMINI.md`, including strict push safety and atomic commit mandates.
