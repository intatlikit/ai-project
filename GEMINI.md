# Project Instructions
This project is a specialized environment designed for text transformation, conversion, and automated documentation. It leverages a suite of specialized agents and skills to assist users in generating high-quality artifacts.

## 🚀 Core Features
- **Specialized Agents & Skills:** The workspace utilizes tools like `conversion-orchestrator`, `json-to-kotlin`, `text-rearranger`, and `screaming-snake-converter` to handle complex transformation tasks.
- **Automated Output:** All generated results, whether they are code (e.g., `.kt`) or analysis (e.g., `.txt`), are automatically saved to the `output/` directory.

## 🛠 Standards
- **Output Integrity:** Ensure the `output/` directory exists before writing any artifacts.
- **Naming:** Use descriptive names for generated files to maintain clarity.
- **Consistency:** Adhere to established formatting and engineering rules provided by the specialized skills.
- **Atomic Commits:** Prefer small, atomic commits that represent a single logical change. Avoid "squashing" unrelated changes into a single commit.
- **Push Safety:** The AI Agent MUST NEVER push to the `main` branch unless the user explicitly issues a command to do so (e.g., "push to main"). The agent should wait for this command rather than proactively asking for it after every commit.
- **Clarification:** If any instruction or requirement is unclear, you MUST ask the user for clarification every time before proceeding. Do not make assumptions.
