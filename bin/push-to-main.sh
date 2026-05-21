#!/bin/bash

# Exit on error
set -e

# ANSI Color Codes for beautiful CLI output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${BLUE}${BOLD}🚀 Starting Atomic Git Push Pipeline...${NC}\n"

# Check if we are in a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo -e "${RED}❌ Error: Not in a Git repository.${NC}"
    exit 1
fi

# Function to handle atomic commits
make_commit() {
    # Display current status
    echo -e "${CYAN}📁 Current Git Status:${NC}"
    git status -s
    echo ""

    echo -e "${YELLOW}Stage the files you want to commit now (e.g., 'git add file1.txt' or 'git add -p').${NC}"
    echo -e "${YELLOW}Type 'done' when you are finished staging for THIS commit, or 'skip' to skip committing.${NC}"
    
    while true; do
        read -rp "git command (or 'done'/'skip'): " cmd
        if [ "$cmd" == "done" ]; then
            break
        elif [ "$cmd" == "skip" ]; then
            return 1
        else
            eval "$cmd"
            git status -s
        fi
    done

    # Check if anything is staged
    if [ -z "$(git diff --cached --name-only)" ]; then
        echo -e "${RED}⚠️ Nothing staged. Skipping commit.${NC}"
        return 1
    fi

    # Prompt for Conventional Commit Type
    echo -e "\n${CYAN}Select the type of change you are committing:${NC}"
    echo -e "  ${BOLD}1)${NC} ✨ feat     (A new feature)"
    echo -e "  ${BOLD}2)${NC} 🐛 fix      (A bug fix)"
    echo -e "  ${BOLD}3)${NC} 📝 docs     (Documentation only changes)"
    echo -e "  ${BOLD}4)${NC} 🎨 style    (Formatting, missing semi-colons, etc; no code change)"
    echo -e "  ${BOLD}5)${NC} ♻️  refactor (A code change that neither fixes a bug nor adds a feature)"
    echo -e "  ${BOLD}6)${NC} ⚡️ perf     (A code change that improves performance)"
    echo -e "  ${BOLD}7)${NC} 🧪 test     (Adding missing tests or correcting existing tests)"
    echo -e "  ${BOLD}8)${NC} 🔧 chore    (Build process, auxiliary tools, libraries, dependency updates)"

    read -rp "Enter number (1-8): " type_choice

    case $type_choice in
        1) type="feat" ;;
        2) type="fix" ;;
        3) type="docs" ;;
        4) type="style" ;;
        5) type="refactor" ;;
        6) type="perf" ;;
        7) type="test" ;;
        8) type="chore" ;;
        *) 
            echo -e "${RED}❌ Invalid choice. Aborting.${NC}"
            return 1
            ;;
    esac

    # Prompt for message
    read -rp "Enter commit message: " commit_msg

    if [ -z "$commit_msg" ]; then
        echo -e "${RED}❌ Commit message cannot be empty. Aborting.${NC}"
        return 1
    fi

    # Format commit message
    formatted_message="$type: $commit_msg"

    echo -e "\n${BLUE}📝 Committing changes with message: ${BOLD}$formatted_message${NC}"
    git commit -m "$formatted_message"
    return 0
}

# Main Loop for Multiple Commits
while true; do
    if ! make_commit; then
        echo -e "${YELLOW}No more commits prepared.${NC}"
    fi

    read -rp "Do you want to prepare another commit? (y/n): " another
    if [[ ! "$another" =~ ^[Yy]$ ]]; then
        break
    fi
done

# Final Push Confirmation
num_commits=$(git rev-list --count origin/main..HEAD)

if [ "$num_commits" -eq 0 ]; then
    echo -e "${YELLOW}ℹ️ No new commits to push.${NC}"
    exit 0
fi

echo -e "\n${CYAN}🚀 You have ${BOLD}$num_commits${NC} ${CYAN}commits ready to push to origin/main.${NC}"
read -rp "Are you sure you want to push to origin/main? (y/n): " confirm_push

if [[ "$confirm_push" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Pushing to remote origin/main...${NC}"
    if git push origin main; then
        echo -e "\n${GREEN}${BOLD}🎉 Success! Changes successfully pushed to origin/main.${NC}\n"
    else
        echo -e "\n${RED}❌ Error: Git push failed.${NC}\n"
        exit 1
    fi
else
    echo -e "${YELLOW}Push cancelled. Your commits remain local.${NC}"
fi
