#!/data/data/com.termux/files/usr/bin/bash
# install.sh - BD My Termux Tools Installer

echo ""
echo "🇧🇩 BD My Termux Tools Installation"
echo "==================================="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Banner - Fixed ASCII art
echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║         BD MY TERMUX TOOLS          ║"
echo "║        Created by Masum Vai         ║"
echo "║          Made in Bangladesh         ║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"

# Check Termux
if [ ! -d "$PREFIX" ]; then
    echo -e "${RED}❌ Error: This script must run in Termux${NC}"
    exit 1
fi

# Check internet (optional - don't exit if no internet)
echo -e "${YELLOW}📡 Checking internet connection...${NC}"
if ! ping -c 1 google.com &> /dev/null; then
    echo -e "${YELLOW}⚠️  No internet connection - continuing offline installation${NC}"
    HAS_INTERNET=false
else
    echo -e "${GREEN}✅ Internet connection available${NC}"
    HAS_INTERNET=true
fi

# Update packages only if internet available
if [ "$HAS_INTERNET" = true ]; then
    echo -e "${YELLOW}🔄 Updating packages...${NC}"
    pkg update -y && pkg upgrade -y

    echo -e "${YELLOW}📦 Installing dependencies...${NC}"
    pkg install -y git curl wget python nodejs vim nano
else
    echo -e "${YELLOW}📦 Skipping package updates (no internet)${NC}"
fi

# Create directories
echo -e "${YELLOW}📁 Creating directories...${NC}"
mkdir -p $PREFIX/bin
mkdir -p $HOME/.config/bdtermux
mkdir -p $HOME/.bdtermux/backups

# Install tools
echo -e "${YELLOW}🚀 Installing BD Tools...${NC}"
for tool in bin/*; do
    if [ -f "$tool" ]; then
        tool_name=$(basename "$tool")
        cp "$tool" "$PREFIX/bin/"
        chmod +x "$PREFIX/bin/$tool_name"
        echo -e "${GREEN}✅ Installed: $tool_name${NC}"
    fi
done

# Copy config (if config directory exists)
echo -e "${YELLOW}⚙️  Copying configurations...${NC}"
if [ -d "config" ]; then
    cp -r config/* $HOME/.config/bdtermux/ 2>/dev/null || true
    echo -e "${GREEN}✅ Configurations copied${NC}"
else
    echo -e "${YELLOW}⚠️  No config directory found${NC}"
fi

# Create backup of original files
echo -e "${YELLOW}💾 Creating backups...${NC}"
cp $HOME/.bashrc $HOME/.bdtermux/backups/bashrc.backup 2>/dev/null || echo -e "${YELLOW}⚠️  Could not backup .bashrc${NC}"
cp $HOME/.zshrc $HOME/.bdtermux/backups/zshrc.backup 2>/dev/null || echo -e "${YELLOW}⚠️  Could not backup .zshrc${NC}"

# Final message
echo ""
echo -e "${GREEN}🎉 Installation completed successfully!${NC}"
echo ""
echo -e "${CYAN}📋 Available Commands:${NC}"
echo -e "${BLUE}  bdsys${NC}     - Bangladeshi System Info"
echo -e "${BLUE}  bdpkg${NC}     - Smart Package Manager"
echo -e "${BLUE}  bdfiles${NC}   - File Management"
echo -e "${BLUE}  bdnet${NC}     - Network Diagnostics"
echo -e "${BLUE}  bdbackup${NC}  - Backup Utility"
echo -e "${BLUE}  bdstyle${NC}   - Termux Customization"
echo ""
echo -e "${YELLOW}🚀 Type 'bdsys' to test installation!${NC}"
echo -e "${PURPLE}💡 Created by Masum Vai 🇧🇩${NC}"
