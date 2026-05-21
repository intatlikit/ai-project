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

echo -e "${BLUE}${BOLD}🚀 Starting Smart Git Push Pipeline...${NC}\n"

# Check if we are in a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo -e "${RED}❌ Error: Not in a Git repository.${NC}"
    exit 1
fi

# Check for changes
changes=$(git status --porcelain)
if [ -z "$changes" ]; then
    echo -e "${YELLOW}ℹ️ No changes detected. Nothing to commit or push.${NC}"
    exit 0
fi

# Display changed files
echo -e "${CYAN}📁 Changed files:${NC}"
git status -s
echo ""

# Prompt for Conventional Commit Type
echo -e "${CYAN}Select the type of change you are committing:${NC}"
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
        exit 1
        ;;
esac

# Prompt for message
read -rp "Enter commit message: " commit_msg

if [ -z "$commit_msg" ]; then
    echo -e "${RED}❌ Commit message cannot be empty. Aborting.${NC}"
    exit 1
fi

# Format commit message
formatted_message="$type: $commit_msg"

echo -e "\n${BLUE}📝 Preparing commit with message: ${BOLD}$formatted_message${NC}"

# Stage all changes
echo -e "${YELLOW}Staging files...${NC}"
git add .

# Commit
echo -e "${YELLOW}Committing changes...${NC}"
git commit -m "$formatted_message"

# Push to origin main
echo -e "${YELLOW}Pushing to remote origin/main...${NC}"
if git push origin main; then
    echo -e "\n${GREEN}${BOLD}🎉 Success! Changes successfully committed and pushed to origin/main.${NC}\n"
else
    echo -e "\n${RED}❌ Error: Git push failed. Please check your network or repository permissions.${NC}\n"
    exit 1
fi
