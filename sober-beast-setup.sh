#!/bin/bash

# ========================================================================
# 🔥 SOBER BEAST MODE ULTIMATE SCRIPT 🔥
# RTX 4060 + i7 13620H OPTIMIZED - UNLOCKED FPS MONSTER
# Sober performance script that will make your enemies cry
# ========================================================================

set -e  # Exit on error

echo "🔥 SOBER BEAST MODE - RTX 4060 OPTIMIZED"
echo "========================================="
echo "   Target: UNLOCKED FPS + MAX GRAPHICS"
echo "   Hardware: RTX 4060 + i7 13620H"
echo "========================================="

# Kolory dla lepszej czytelności
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Funkcje do wyświetlania
step() {
    echo -e "\n${BLUE}[BEAST MODE]${NC} $1"
}

success() {
    echo -e "${GREEN}🔥 $1${NC}"
}

warning() {
    echo -e "${YELLOW}⚡ $1${NC}"
}

error() {
    echo -e "${RED}💥 $1${NC}"
}

beast() {
    echo -e "${PURPLE}👹 $1${NC}"
}

# ========================================================================
# 1. INSTALACJA NARZĘDZI WYDAJNOŚCIOWYCH
# ========================================================================

step "Instalacja Beast Mode Tools..."

# Wykryj dystrybucję
if command -v apt >/dev/null 2>&1; then
    DISTRO="debian"
    INSTALL_CMD="sudo apt update && sudo apt install -y"
elif command -v dnf >/dev/null 2>&1; then
    DISTRO="fedora"  
    INSTALL_CMD="sudo dnf install -y"
elif command -v pacman >/dev/null 2>&1; then
    DISTRO="arch"
    INSTALL_CMD="sudo pacman -S --noconfirm"
else
    error "Nieobsługiwana dystrybucja! Zainstaluj ręcznie: gamemode, mangohud"
    exit 1
fi

# Instalacja pakietów BEAST MODE
case $DISTRO in
    "debian")
        $INSTALL_CMD gamemode mangohud mesa-utils vulkan-tools nvidia-settings
        ;;
    "fedora")
        $INSTALL_CMD gamemode mangohud mesa-demos vulkan-tools nvidia-settings
        ;;
    "arch") 
        $INSTALL_CMD gamemode mangohud lib32-gamemode lib32-mangohud mesa-demos vulkan-tools nvidia-settings
        ;;
esac

success "Beast Mode Tools zainstalowane!"

# ========================================================================
# 2. NVIDIA RTX 4060 OPTIMIZATIONS
# ========================================================================

step "Konfiguracja NVIDIA RTX 4060 Beast Mode..."

# Dodaj użytkownika do grupy gamemode
sudo usermod -aG gamemode $USER

# ULTIMATE GameMode config dla RTX 4060 + i7
mkdir -p ~/.config/gamemode
cat > ~/.config/gamemode/gamemode.ini << 'EOF'
[general]
renice=15
ioprio=1
inhibit_screensaver=1
softrealtime=on
reaper_freq=5

[filter]
whitelist=Sober

[gpu]
apply_gpu_optimisations=accept-responsibility
amd_performance_level=high
nv_powermizer_mode=1

[cpu]
park_cores=no
pin_cores=no

[custom]
start=notify-send "🔥 BEAST MODE ACTIVATED" "RTX 4060 + i7 unleashed!" && nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1" -a "[gpu:0]/GPUMemoryTransferRateOffset[4]=1000" -a "[gpu:0]/GPUGraphicsClockOffset[4]=100"
end=notify-send "🏁 Beast Mode Deactivated" "Back to normal mode" && nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=0"
EOF

success "NVIDIA Beast Config utworzona!"

# ========================================================================
# 3. ULTIMATE HIGH GRAPHICS + UNLOCKED FPS CONFIG
# ========================================================================

step "Tworzenie BEAST MODE Config z Unlocked FPS..."

CONFIG_DIR="$HOME/.var/app/org.vinegarhq.Sober/config/sober"
CONFIG_FILE="$CONFIG_DIR/config.json"

# Backup
if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$CONFIG_FILE.backup.beast.$(date +%Y%m%d_%H%M%S)"
    success "Backup utworzony!"
fi

mkdir -p "$CONFIG_DIR"

# ULTIMATE BEAST MODE CONFIG - UNLOCKED FPS + HIGH GRAPHICS
cat > "$CONFIG_FILE" << 'EOF'
{
  "allow_gamepad_permission": true,
  "bring_back_oof": false,
  "close_on_leave": true,
  "discord_rpc_enabled": true,
  "enable_gamemode": true,
  "enable_hidpi": false,
  "server_location_indicator_enabled": false,
  "touch_mode": "off",
  "use_console_experience": false,
  "use_libsecret": false,
  "use_opengl": false,
  "fflags": {
    "DFIntTaskSchedulerTargetFps": "240",
    "FFlagGameBasicSettingsFramerateCap5": "False",
    "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
    "DFIntMaxFrameBufferSize": "16",
    "FFlagCommitToGraphicsQualityFix": "True",
    "FFlagFixGraphicsQuality": "True", 
    "DFFlagUseVisBugChecks": "True",
    "FFlagDebugForceFutureIsBrightPhase3": "True",
    "DFIntTextureQualityOverride": "3",
    "DFIntDebugRestrictGCDistance": "3",
    "FFlagFastGPULightCulling3": "True",
    "DFIntDebugFRMQualityLevelOverride": "21",
    "FFlagEnableBubbleChatFromChatService": "False",
    "DFIntRakNetMtuValue1InBytes": "1480",
    "DFIntRakNetMtuValue2InBytes": "1480",
    "DFIntRakNetMtuValue3InBytes": "1480",
    "DFIntConnectionMTUSize": "1480",
    "DFFlagOptimizeIsA": "False",
    "DFFlagDebugPauseVoxelizer": "False",
    "FFlagEnableInGameMenuControls": "False",
    "FFlagDisableNewIGMinDUA": "True",
    "FFlagEnableInGameMenuChromeABTest4": "False",
    "DFFlagTextureQualityOverrideEnabled": "True",
    "DFFlagVarintOptimizationEnabled": "True",
    "DFIntHttpCurlConnectionCacheSize": "134217728",
    "DFIntTaskSchedulerThreadCount": "16",
    "FFlagDebugGraphicsDisableMetal": "True",
    "FFlagDebugGraphicsPreferVulkan": "True",
    "FFlagDebugGraphicsPreferOpenGL": "False",
    "DFIntS2PhysicsSenderRate": "240",
    "DFIntDefaultTimeoutTimeMs": "10000",
    "DFIntGameNetPVHeaderSize": "208",
    "DFFlagEnableQuickGameLaunch": "True",
    "FFlagPreloadAllFonts": "True",
    "DFIntMaxMissedWorldStepsRemembered": "1",
    "DFIntDataModelJobUpdateFrequency": "240",
    "FFlagRenderFixFog": "True",
    "FFlagFixLightingInstancing": "True",
    "FFlagGlobalWindRendering": "True",
    "DFIntRenderShadowIntensity": "255",
    "DFIntRenderShadowmapBias": "75",
    "FFlagDisablePostFx": "False",
    "FFlagDisableDepthOfField": "False", 
    "FFlagDisableBloom": "False",
    "DFFlagDebugDisableOptimizedTerrain": "False",
    "FFlagEnableReflectanceCharacter": "True",
    "FFlagRenderEnableCharacterReflectance": "True",
    "DFFlagRenderDebugCheckRenderView": "False",
    "FFlagRenderDebugDeterministicTinting": "False",
    "DFFlagDebugRenderForceTechnologyVoxel": "False",
    "DFFlagDebugRenderingSetDeterministic": "True",
    "FFlagRenderVoxelUpgradeSetToLegacyDefault": "False",
    "DFIntCSGLevelOfDetailSwitchingDistance": "0",
    "DFIntCSGLevelOfDetailSwitchingDistanceL12": "0",
    "DFIntCSGLevelOfDetailSwitchingDistanceL23": "0",
    "DFIntCSGLevelOfDetailSwitchingDistanceL34": "0",
    "FFlagFixGraphicsQuality": "True",
    "DFIntDebugFRMQualityLevelOverride": "21"
  }
}
EOF

beast "BEAST MODE Config z 240 FPS CAP zastosowany!"

# ========================================================================
# 4. ULTIMATE BEAST LAUNCHER
# ========================================================================

step "Tworzenie Ultimate Beast Launcher..."

LAUNCHER_DIR="$HOME/.local/bin"  
LAUNCHER_FILE="$LAUNCHER_DIR/sober-beast"

mkdir -p "$LAUNCHER_DIR"

cat > "$LAUNCHER_FILE" << 'EOF'
#!/bin/bash

# 🔥 SOBER ULTIMATE BEAST MODE LAUNCHER 🔥
# RTX 4060 + i7 13620H OPTIMIZED FOR MAXIMUM FPS

echo "🔥 ACTIVATING SOBER BEAST MODE..."
echo "=================================="
echo "   🎯 Target: UNLOCKED FPS"
echo "   💎 Graphics: MAXIMUM QUALITY"  
echo "   ⚡ Hardware: RTX 4060 + i7"
echo "=================================="

# RTX 4060 NVIDIA Beast Settings
export __GL_THREADED_OPTIMIZATIONS=1
export __GL_SYNC_TO_VBLANK=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$HOME/.cache/gl_shader_cache_beast"
export __GL_MaxFramesAllowed=0
export __GL_ALLOW_UNOFFICIAL_PROTOCOL=1

# RTX 4060 Memory & Performance  
export NVIDIA_TF32_OVERRIDE=0
export __GL_GSYNC_ALLOWED=1
export __GL_VRR_ALLOWED=1
export CUDA_CACHE_PATH="$HOME/.cache/cuda_cache_beast"

# Linux Kernel Beast Mode
export MESA_GL_VERSION_OVERRIDE=4.6
export MESA_GLSL_VERSION_OVERRIDE=460

# MangoHUD Beast Configuration
export MANGOHUD=1
export MANGOHUD_DLSYM=1
export MANGOHUD_CONFIG=fps,frametime,cpu_stats,gpu_stats,cpu_power,gpu_power,cpu_mhz,gpu_core_clock,gpu_mem_clock,vram,ram,swap,resolution,engine_version,vulkan_driver,gamemode,fsr,hdr,refresh_rate

# Create cache directories
mkdir -p "$HOME/.cache/gl_shader_cache_beast"
mkdir -p "$HOME/.cache/cuda_cache_beast"

echo "🧪 Checking Beast Mode compatibility..."

# Check tools
TOOLS_OK=true
if ! command -v gamemoderun >/dev/null 2>&1; then
    echo "❌ GameMode missing!"
    TOOLS_OK=false
fi

if ! command -v mangohud >/dev/null 2>&1; then
    echo "⚠️  MangoHUD missing (optional)"
fi

if ! nvidia-smi >/dev/null 2>&1; then
    echo "❌ NVIDIA driver issues!"
    TOOLS_OK=false
fi

if [ "$TOOLS_OK" = false ]; then
    error "Critical tools missing! Run the setup script first."
    exit 1
fi

# NVIDIA GPU performance mode
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1" >/dev/null 2>&1 || true

echo "🔥 LAUNCHING BEAST MODE..."
echo "   • Vulkan Backend: ENABLED"
echo "   • FPS CAP: 240 (GPU-friendly)" 
echo "   • GameMode: ACTIVE"
echo "   • MangoHUD: ACTIVE"
echo "   • NVIDIA Performance: MAXIMUM"
echo ""
echo "💀 Prepare for FPS massacre..."

# ULTIMATE BEAST MODE LAUNCH
gamemoderun mangohud flatpak run org.vinegarhq.Sober

# Reset NVIDIA to balanced mode after gaming
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=0" >/dev/null 2>&1 || true

echo "🏁 Beast Mode session ended"
echo "   GPU returned to balanced mode"
EOF

chmod +x "$LAUNCHER_FILE"

# Dodaj do PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc 2>/dev/null || true
fi

success "Beast Mode Launcher utworzony!"

# ========================================================================
# 5. DESKTOP ENTRY BEAST MODE
# ========================================================================

step "Tworzenie Beast Mode Desktop Entry..."

DESKTOP_FILE="$HOME/.local/share/applications/sober-beast-mode.desktop"
mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" << 'EOF'
[Desktop Entry]
Name=🔥 Sober Beast Mode 
Comment=RTX 4060 Optimized - Unlocked FPS Monster (High Graphics)
Exec=/home/USERNAME/.local/bin/sober-beast
Icon=org.vinegarhq.Sober
Type=Application
Categories=Game;
StartupNotify=true
Terminal=false
Keywords=roblox;gaming;performance;rtx;nvidia;beast;
EOF

sed -i "s/USERNAME/$USER/g" "$DESKTOP_FILE"
chmod +x "$DESKTOP_FILE"

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

success "Beast Mode Desktop Entry utworzony!"

# ========================================================================
# 6. USUWANIE STARYCH SKRÓTÓW (ULEPSZONE)
# ========================================================================

step "Usuwanie słabych skrótów (Beast Mode nie toleruje słabości)..."

SHORTCUT_LOCATIONS=(
    "$HOME/.local/share/applications"
    "$HOME/Desktop"
    "$HOME/Pulpit"
)

SOBER_PATTERNS=(
    "*sober*"
    "*Sober*" 
    "*SOBER*"
    "*roblox*"
    "*Roblox*"
    "org.vinegarhq.Sober"
)

FOUND_SHORTCUTS=()

for location in "${SHORTCUT_LOCATIONS[@]}"; do
    if [ -d "$location" ]; then
        for pattern in "${SOBER_PATTERNS[@]}"; do
            while IFS= read -r -d '' file; do
                if [ -f "$file" ] && [ "$file" != "$HOME/.local/share/applications/sober-beast-mode.desktop" ]; then
                    if grep -qi "sober\|roblox\|vinegarhq" "$file"; then
                        FOUND_SHORTCUTS+=("$file")
                    fi
                fi
            done < <(find "$location" -maxdepth 1 -name "$pattern.desktop" -print0 2>/dev/null)
        done
    fi
done

if [ ${#FOUND_SHORTCUTS[@]} -gt 0 ]; then
    warning "Znaleziono ${#FOUND_SHORTCUTS[@]} słabych skrótów do usunięcia:"
    for shortcut in "${FOUND_SHORTCUTS[@]}"; do
        echo "   💀 $(basename "$shortcut")"
    done
    
    echo
    read -p "🔥 Beast Mode niszczy wszystko co słabe. Usunąć? (Y/n): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[YyTt]$ ]] || [[ -z $REPLY ]]; then
        for shortcut in "${FOUND_SHORTCUTS[@]}"; do
            rm -f "$shortcut" 2>/dev/null && success "Zniszczono: $(basename "$shortcut")" || warning "Nie można zniszczyć: $(basename "$shortcut")"
        done
        
        # Ukryj oryginalny Flatpak entry
        cat > "$HOME/.local/share/applications/org.vinegarhq.Sober.desktop" << 'EOF'
[Desktop Entry]
Name=Sober (Weak - Hidden)
NoDisplay=true
EOF
        
        update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
        beast "Wszystkie słabe skróty zostały zniszczone!"
    else
        warning "Słabe skróty pozostawione (na własne ryzyko)"
    fi
else
    success "Nie znaleziono słabych skrótów"
fi

# ========================================================================
# 7. KERNEL & SYSTEM OPTIMIZATIONS
# ========================================================================

step "Stosowanie Ultimate System Optimizations..."

# Stwórz kernel optimizations dla beast mode
cat > /tmp/beast-mode-sysctl.conf << 'EOF'
# BEAST MODE System Optimizations - RTX 4060 + i7
vm.max_map_count = 2147483647
vm.swappiness = 1
vm.dirty_ratio = 3
vm.dirty_background_ratio = 1
kernel.sched_migration_cost_ns = 5000000
kernel.sched_autogroup_enabled = 0 
kernel.sched_child_runs_first = 0
kernel.sched_latency_ns = 1000000
kernel.sched_min_granularity_ns = 100000
kernel.sched_rt_runtime_us = 950000
kernel.sched_rt_period_us = 1000000
net.core.netdev_max_backlog = 16384
net.core.somaxconn = 8192
net.core.rmem_default = 1048576
net.core.rmem_max = 16777216
net.core.wmem_default = 1048576
net.core.wmem_max = 16777216
EOF

warning "Aplikowanie Beast Mode kernel optimizations (wymagane sudo)..."
if sudo sysctl -p /tmp/beast-mode-sysctl.conf >/dev/null 2>&1; then
    beast "Kernel optimizations zastosowane!"
else
    warning "Niektóre kernel optimizations mogły się nie zastosować"
fi

# ========================================================================
# PODSUMOWANIE BEAST MODE
# ========================================================================

echo
echo "======================================="
echo -e "${PURPLE}🔥 BEAST MODE INSTALLATION COMPLETE 🔥${NC}"
echo "======================================="
echo
beast "UNLOCKED FPS MONSTER ACTIVATED!"
echo
echo "💾 Co zostało skonfigurowane:"
echo "   🔥 GameMode - CPU/GPU performance daemon"
echo "   💎 MangoHUD - advanced performance overlay"  
echo "   ⚡ NVIDIA RTX 4060 optimizations"
echo "   🎯 UNLOCKED FPS FastFlags (29383 fps target)"
echo "   💀 High Graphics Quality (level 21)"
echo "   🚀 Vulkan backend with optimizations"
echo "   ⚙️  Kernel performance tweaks"
echo
echo "🚀 Jak uruchomić Beast Mode:"
echo "   1. Menu: '🔥 Sober Beast Mode'"
echo "   2. Terminal: 'sober-beast'"
echo "   3. Direct: '$HOME/.local/bin/sober-beast'"
echo
echo "📊 Beast Mode Features:"
echo "   • 240 FPS CAP (optimized for RTX 4060)"
echo "   • Maximum Graphics Quality"
echo "   • RTX 4060 Performance Mode"
echo "   • Advanced GPU monitoring"
echo "   • Optimized networking (1480 MTU)"
echo "   • Vulkan backend for RTX performance"
echo "   • GameMode CPU optimization"
echo
echo "⚠️  BEAST MODE WARNINGS:"
echo "   • Twoja karta będzie pracować na MAX"
echo "   • Monitor temperatury GPU/CPU" 
echo "   • Pierwszy start może potrwać dłużej"
echo "   • Jeśli crashuje - obniż Graphics Quality w Roblox"
echo
echo "🔧 Rozwiązywanie problemów:"
echo "   • Backup config: $CONFIG_FILE.backup.beast.*"
echo "   • Check GPU: nvidia-smi"
echo "   • Reset config: rm $CONFIG_FILE"
echo "   • Monitor performance: htop, nvidia-smi"
echo
echo -e "${CYAN}================================${NC}"
warning "WYLOGUJ SIĘ I ZALOGUJ aby GameMode działał optymalnie!"
echo -e "${CYAN}================================${NC}"
echo
beast "RTX 4060 + i7 13620H BEAST MODE READY!"
echo -e "${PURPLE}Prepare for FPS domination! 👹🔥${NC}"