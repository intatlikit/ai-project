#!/bin/bash

# Exit on error
set -e

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${BLUE}${BOLD}🚀 Starting Optimized Atomic Push Pipeline...${NC}\n"

# Fast sanity checks
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo -e "${RED}❌ Error: Not in a Git repository.${NC}"
    exit 1
fi

# Function for atomic commits
make_commit() {
    echo -e "${CYAN}📁 Status Overview:${NC}"
    git status --short
    echo ""

    echo -e "${YELLOW}Stage files (e.g., 'git add <file>'). Type 'done' to commit, 'skip' to exit.${NC}"
    
    while true; do
        read -rp "git command: " cmd
        [[ "$cmd" == "done" ]] && break
        [[ "$cmd" == "skip" ]] && return 1
        eval "$cmd"
        git status --short
    done

    # Validate staged changes
    staged_files=$(git diff --cached --name-only)
    if [[ -z "$staged_files" ]]; then
        echo -e "${RED}⚠️ No changes staged. Skipping.${NC}"
        return 1
    fi

    # Optimized type selection
    echo -e "\n${CYAN}Commit Type: 1)feat 2)fix 3)docs 4)style 5)refactor 6)perf 7)test 8)chore${NC}"
    read -rp "Selection (1-8): " type_choice

    case $type_choice in
        1) type="feat" ;;
        2) type="fix" ;;
        3) type="docs" ;;
        4) type="style" ;;
        5) type="refactor" ;;
        6) type="perf" ;;
        7) type="test" ;;
        8) type="chore" ;;
        *) echo -e "${RED}Invalid choice.${NC}"; return 1 ;;
    esac

    read -rp "Commit message: " commit_msg
    [[ -z "$commit_msg" ]] && { echo -e "${RED}Empty message.${NC}"; return 1; }

    formatted_msg="$type: $commit_msg"
    echo -e "${BLUE}📝 Committing: ${BOLD}$formatted_msg${NC}"
    git commit -m "$formatted_msg"
    return 0
}

# Execution Loop
while true; do
    if ! make_commit; then
        echo -e "${YELLOW}No further commits prepared.${NC}"
    fi

    read -rp "Another commit? (y/n): " another
    [[ ! "$another" =~ ^[Yy]$ ]] && break
done

# Summary (No proactive push prompt per protocol)
num_commits=$(git rev-list --count origin/main..HEAD 2>/dev/null || echo "0")
if [ "$num_commits" -gt 0 ]; then
    echo -e "\n${GREEN}✅ Success! ${BOLD}$num_commits${NC}${GREEN} commits are ready locally.${NC}"
    echo -e "${CYAN}Run 'push to main' or 'git push origin main' when ready.${NC}"
else
    echo -e "${YELLOW}ℹ️ No new commits created.${NC}"
fi
