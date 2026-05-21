# Project Instructions
This project is a high-performance environment for text transformation, conversion, and automated documentation. It utilizes a sophisticated system of specialized agents and skills to deliver consistent, high-quality technical artifacts.

## 🚀 Core Features

### Agents
- **conversion-orchestrator**: Automates end-to-end text transformation workflows, intelligently routing inputs to the most appropriate skills.

### Skills
- **commit-message-agent**: Analyzes staged changes and generates high-quality, descriptive commit messages following the Conventional Commits standard.
- **json-to-kotlin**: Converts JSON objects or schemas into idiomatic, production-ready Kotlin data classes.
- **screaming-snake-converter**: Standardizes identifiers into `SCREAMING_SNAKE_CASE`.
- **text-rearranger**: Formats configuration keys and fields into specialized function-like wrappers.

## 📂 Project Structure
- **`.gemini/`**: Contains the "brain" of the project, including agent definitions, specialized skills, and system settings.
- **`bin/`**: Houses optimized pipeline scripts, such as the atomic `push-to-main.sh`.
- **`output/`**: The designated directory for all generated artifacts (code, analysis, and formatted text).

## 🛠 Engineering Standards
- **Output Integrity**: All generated artifacts MUST be saved within the `output/` directory.
- **Atomic Commits**: Every commit should represent a single logical change. Large "squash" commits containing unrelated changes are prohibited.
- **Push Safety (Strict)**: The AI Agent MUST NEVER push to the `main` branch unless the user explicitly issues the command (e.g., "push to main"). Proactive push prompts are disabled.
- **Consistency**: All code and documentation must adhere to the style and formatting rules defined in the respective `.gemini/skills/` modules.
- **Clarification**: In case of ambiguity or missing information, the agent MUST ask for user clarification before proceeding.

## ⚡ Performance Pipeline
The project uses an optimized `bin/push-to-main.sh` script designed for speed and reliability, supporting atomic staging and automated conventional commit suggestions.
