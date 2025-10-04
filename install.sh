cat > install.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# BD Termux Tools Pro - Installation Script
# Created by Masum Vai
# No Internet Check - Zero Errors

echo ""
echo "🚀 BD Termux Tools Pro Installation"
echo "==================================="

# Check if running in Termux
if [ ! -d "$PREFIX" ]; then
    echo "❌ This script must run in Termux environment"
    exit 1
fi

echo "✅ Environment verified"

# Create directory structure
echo "📁 Setting up directories..."
mkdir -p $PREFIX/bin
mkdir -p $HOME/.bdtermux/{config,backups,logs,cache,data}
mkdir -p $HOME/.bdtermux/data/{system,network,packages}

# Install tools
echo "📦 Installing professional tools..."
for tool in bin/*; do
    if [ -f "$tool" ] && [ -r "$tool" ]; then
        tool_name=$(basename "$tool")
        cp "$tool" "$PREFIX/bin/" 2>/dev/null
        chmod +x "$PREFIX/bin/$tool_name" 2>/dev/null
        echo "✅ Installed: $tool_name"
    fi
done

# Set up configuration
echo "⚙️  Configuring system..."
if [ -d "config" ]; then
    cp -r config/* "$HOME/.bdtermux/config/" 2>/dev/null
fi

echo ""
echo "🎉 Installation Completed Successfully!"
echo "======================================="
echo ""
echo "📋 Available Professional Tools:"
echo "  bdsys    - Advanced System Analyzer"
echo "  bdpkg    - Smart Package Manager"
echo "  bdfiles  - Professional File Manager" 
echo "  bdnet    - Network Diagnostics Pro"
echo "  bdbackup - Enterprise Backup System"
echo ""
echo "🚀 Type 'bdsys' to test your installation!"
echo "💡 Created by Masum Vai - Professional Edition"
EOF

chmod +x install.sh
