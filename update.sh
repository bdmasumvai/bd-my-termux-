#!/data/data/com.termux/files/usr/bin/bash
# update.sh

echo ""
echo "🔄 BD My Termux Tools Update"
echo "============================"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

cd "$(dirname "$0")"

echo -e "${YELLOW}📥 Checking for updates...${NC}"
git fetch origin

if git status | grep -q "behind"; then
    echo -e "${BLUE}🔄 New version available! Updating...${NC}"
    git pull origin main
    echo -e "${YELLOW}🔄 Reinstalling tools...${NC}"
    ./install.sh
else
    echo -e "${GREEN}✅ Already up to date!${NC}"
fi