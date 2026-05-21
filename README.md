# AI Agent Project: Text Transformation & Automated Documentation

Welcome to the **AI Agent Project** workspace! This is a specialized environment designed for text transformation, data model conversion, and automated documentation generation. It utilizes advanced agent workflows to turn raw data (like JSON payloads or API request specs) into structured codebase models and documentation.

## 🚀 Core Features

- **JSON to Kotlin Data Class Conversion:** Automatically transform JSON payloads into production-ready Kotlin data classes annotated with GSON serialization tags (e.g., `@SerializedName`).
- **Confluence-Compatible API Analysis:** Parse API requests, headers, content payloads, and status codes into formatted Markdown/Text documentation ready for Confluence or internal developer wikis.
- **Screaming Snake Case Conversion & Formatting:** Tools to convert names, variables, and identifiers to standard formats and rearrange structured text.

---

## 📁 Repository Structure

```
├── .gemini/               # Local workspace settings and agent instructions (gitignored)
├── output/                # Directory containing all generated artifacts
│   ├── confluence_request_analysis.txt  # Parsed API documentation structure
│   ├── dataclass.kt                     # Generated Kotlin data classes for JSON responses
│   └── formatted_text.txt               # Parsed and annotated Kotlin request structures
├── GEMINI.md              # Project guidelines and compliance rules for the AI Agent
├── README.md              # Main project documentation (this file)
└── .gitignore             # Configured Git ignore rules
```

---

## 🛠️ Generated Artifacts in `output/`

* **[confluence_request_analysis.txt](file:///Users/i.likitpolchaloon/Desktop/ai-agent-project/output/confluence_request_analysis.txt):** A structured API documentation page specifying standard request headers (e.g., `reqChannel`, `correlationID`), main payload structures, sample requests, response bodies, and status codes.
* **[dataclass.kt](file:///Users/i.likitpolchaloon/Desktop/ai-agent-project/output/dataclass.kt):** Generates full Kotlin classes for complex JSON responses with nested objects like `CurrentBilling` and `BillTransaction`.
* **[formatted_text.txt](file:///Users/i.likitpolchaloon/Desktop/ai-agent-project/output/formatted_text.txt):** Annotated Kotlin classes representing incoming requests (e.g., `HeaderReq` and `Content`) along with code usage guidelines.

---

## ⚙️ Development & Standards

* **Output Integrity:** All generated files (code, analysis, transformations) must be saved inside the `output/` directory.
* **Agent Operations:** The AI Agent references instructions in `GEMINI.md` to adhere to formatting and naming standards.

