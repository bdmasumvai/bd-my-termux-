#!/data/data/com.termux/files/usr/bin/bash
# uninstall.sh

echo ""
echo "🗑️  BD My Termux Tools Uninstallation"
echo "===================================="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}⚠️  Removing BD Tools...${NC}"

# Remove tools
tools=("bdsys" "bdpkg" "bdfiles" "bdnet" "bdbackup" "bdstyle")
for tool in "${tools[@]}"; do
    if [ -f "$PREFIX/bin/$tool" ]; then
        rm -f "$PREFIX/bin/$tool"
        echo -e "${GREEN}✅ Removed: $tool${NC}"
    fi
done

# Remove configs
if [ -d "$HOME/.config/bdtermux" ]; then
    rm -rf "$HOME/.config/bdtermux"
    echo -e "${GREEN}✅ Removed configs${NC}"
fi

# Remove data
if [ -d "$HOME/.bdtermux" ]; then
    rm -rf "$HOME/.bdtermux"
    echo -e "${GREEN}✅ Removed data${NC}"
fi

echo ""
echo -e "${GREEN}🎉 Uninstallation completed!${NC}"
echo -e "${YELLOW}Thanks for using BD My Termux Tools! 🇧🇩${NC}"