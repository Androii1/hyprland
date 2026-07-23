#!/bin/bash

# ============================================
# 🖥️  Instalación de dotfiles de Anderson
# ============================================

# Colores para mensajes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Variables
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config/backup-$(date +%Y%m%d-%H%M%S)"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   🖥️  Instalando dotfiles de Anderson${NC}"
echo -e "${BLUE}========================================${NC}"

# ============================================
# 1. Verificar sistema
# ============================================
if ! command -v pacman &> /dev/null; then
    echo -e "${RED}❌ Este script solo funciona en Arch Linux o CachyOS${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Sistema compatible (Arch/CachyOS)${NC}"

# ============================================
# 2. Crear backup
# ============================================
echo -e "${YELLOW}📦 Creando backup de configuraciones existentes...${NC}"
mkdir -p "$BACKUP_DIR"

# ============================================
# 3. Copiar configuraciones (NO enlaces)
# ============================================
echo -e "${BLUE}📁 Copiando configuraciones...${NC}"

# Lista de configuraciones
folders=(
    "hypr"
    "kitty"
    "fish"
    "fastfetch"
    "walker"
    "waybar"
    "waypaper"
    "elephant"
)

for folder in "${folders[@]}"; do
    if [ -d "$DOTFILES_DIR/$folder" ]; then
        # Si existe en ~/.config, hacer backup
        if [ -d "$HOME/.config/$folder" ]; then
            echo -e "${YELLOW}⚠️  $folder ya existe. Moviendo a backup...${NC}"
            mv "$HOME/.config/$folder" "$BACKUP_DIR/"
        fi
        # Copiar (NO enlace simbólico)
        cp -r "$DOTFILES_DIR/$folder" "$HOME/.config/$folder"
        echo -e "${GREEN}✅ $folder instalado${NC}"
    else
        echo -e "${YELLOW}⏩ Saltando $folder (no encontrado en dotfiles)${NC}"
    fi
done

# Archivos sueltos
if [ -f "$DOTFILES_DIR/starship.toml" ]; then
    if [ -f "$HOME/.config/starship.toml" ]; then
        echo -e "${YELLOW}⚠️  starship.toml ya existe. Moviendo a backup...${NC}"
        mv "$HOME/.config/starship.toml" "$BACKUP_DIR/"
    fi
    cp "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
    echo -e "${GREEN}✅ starship.toml instalado${NC}"
fi

# ============================================
# 4. Finalizar
# ============================================
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   🎉 ¡Instalación completada! 🎉${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e ""
echo -e "${BLUE}📝 Resumen:${NC}"
echo -e "  - Configuraciones copiadas a ~/.config/"
echo -e "  - Backup guardado en: $BACKUP_DIR"
echo -e ""
echo -e "${BLUE}⌨️  Atajos principales:${NC}"
echo -e "  - ${YELLOW}SUPER+Return${NC} → Kitty"
echo -e "  - ${YELLOW}SUPER+D${NC} → Walker"
echo -e "  - ${YELLOW}SUPER+Shift+P${NC} → Menú de Power"
echo -e ""
echo -e "${GREEN}¡Disfruta de tu nuevo entorno! 🎉${NC}"
