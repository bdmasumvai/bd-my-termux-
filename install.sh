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

# Banner
echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║         BD MY TERMUX TOOLS          ║"
║        Created by Masum Vai            ║
echo "║          Made in Bangladesh         ║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"

# Check Termux
if [ ! -d "$PREFIX" ]; then
    echo -e "${RED}❌ Error: This script must run in Termux${NC}"
    exit 1
fi

# Check internet
echo -e "${YELLOW}📡 Checking internet connection...${NC}"
if ! ping -c 1 google.com &> /dev/null; then
    echo -e "${RED}❌ No internet connection${NC}"
    exit 1
fi

# Update packages
echo -e "${YELLOW}🔄 Updating packages...${NC}"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "${YELLOW}📦 Installing dependencies...${NC}"
pkg install -y git curl wget python nodejs vim nano

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

# Copy config
echo -e "${YELLOW}⚙️  Copying configurations...${NC}"
cp -r config/* $HOME/.config/bdtermux/ 2>/dev/null || true

# Create backup of original files
echo -e "${YELLOW}💾 Creating backups...${NC}"
cp $HOME/.bashrc $HOME/.bdtermux/backups/bashrc.backup 2>/dev/null || true
cp $HOME/.zshrc $HOME/.bdtermux/backups/zshrc.backup 2>/dev/null || true

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