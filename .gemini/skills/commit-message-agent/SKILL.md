---
name: commit-message-agent
description: >
  Analyzes staged git changes and generates a high-quality commit message following the
  Conventional Commits standard (feat, fix, docs, refactor, style, perf, test, chore).
  Use this skill whenever the user asks to "suggest a commit message", "analyze my changes",
  "commit this", or "prepare a commit".
---

# Conventional Commit Message Skill

Analyze staged changes and generate idiomatic conventional commit messages using these **expert rules**:

## 🛠 Core Constraints

| Category | Rule |
|---|---|
| **Standards** | **Conventional Commits**: Always follow `<type>: <description>` format. |
| **Analysis** | **Comprehensive Diff**: Run `git diff --staged` to understand the *content* of changes, not just file names. |
| **Language** | **Imperative Mood**: Use "add", "fix", "update" instead of "added", "fixed", "updates". |
| **Formatting** | **Concise Header**: Keep the summary line under 72 characters. |
| **Context** | **Identify Impact**: Determine if changes affect user-facing features, internal logic, or documentation. |

---

## 📋 Type Mapping

| Change Type | Conventional Type | Trigger Keywords/Patterns |
|---|---|---|
| New Feature | `feat` | New files, new functions, UI additions. |
| Bug Fix | `fix` | Error handling, exception catching, logic correction. |
| Documentation | `docs` | README, GEMINI.md, inline comments, JSDoc/KDoc. |
| Style | `style` | Formatting, white-space, missing semi-colons, lint fixes. |
| Refactor | `refactor` | Renaming, code movement, simplifying logic (no behavior change). |
| Performance | `perf` | Optimizations, caching, reducing complexity. |
| Testing | `test` | Adding tests, fixing failing tests, test mocks. |
| Maintenance | `chore` | Build scripts, dependencies, gitignore, meta-files. |

---

## 🏗 Analysis Workflow

1.  **Gather State**:
    - Run `git status` to see which files are staged vs. modified vs. untracked.
    - Run `git diff --staged` to see the actual code delta.
2.  **Determine Primary Type**:
    - If changes span multiple types, prioritize `feat` > `fix` > `refactor`.
    - If many unrelated changes are staged, suggest splitting the commit OR use `feat` if one change is dominant.
3.  **Craft Message**:
    - **Header**: `<type>: <summary>` (e.g., `feat: add user authentication flow`).
    - **Body (Optional)**: If the change is complex, add a blank line followed by a bulleted list of details.

---

## ✍️ Example Suggestions

### Scenario: Added a new helper and updated README
**Message**: `feat: add string utility helper and update documentation`

### Scenario: Fixed a crash in the parser
**Message**: `fix: prevent null pointer exception in JSON parser loop`

---

## 🧪 Execution Procedure

When invoked:
1.  Check for staged changes. If none, ask the user to stage them first or offer to stage them.
2.  Perform the analysis.
3.  Present the proposed message to the user.
4.  Offer to:
    -   Commit directly (`git commit -m "..."`).
    -   Use the project's `./bin/push-to-main.sh` script.
