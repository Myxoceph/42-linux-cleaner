#!/bin/bash

total_savings=0

COLOR_WHITE='\033[0;37m\033[1m'
COLOR_BLUE='\033[0;34m\033[1m'
COLOR_YELLOW='\033[0;33m\033[1m'
COLOR_GREEN='\033[0;32m\033[1m'
COLOR_RED='\033[0;31m\033[1m'
COLOR_CYAN='\033[0;36m\033[1m'
COLOR_END='\033[0m'

clear

echo -e "${COLOR_YELLOW}Behold! The mighty purification of this device doth approach!\n${COLOR_END}"
echo -e "${COLOR_GREEN}Do you wish to proceed with this grand cleansing? (Y/n): ${COLOR_END}"
read confirm
if [[ -n "$confirm" && $confirm != [yY] ]]; then
    echo -e "${COLOR_RED}The cleansing has been halted. The device remains unpurified.${COLOR_END}"
    exit 1
fi

echo -e "${COLOR_WHITE}Commencing purification...${COLOR_END}"

sleep 0.05

# You can add any directories you want to clean under the cache directories section.
cache_directories=(
    "$HOME/.var/app/com.google.Chrome/cache/"
    "$HOME/.npm/_cacache/"
    "$HOME/.bun/install/cache/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/component_crx_cache/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/extensions_crx_cache/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/Default/Service Worker/ScriptCache/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/Default/File System/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/Default/Service Worker/CacheStorage/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/Profile [0-9]/Service Worker/CacheStorage/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/Profile [0-9]/Service Worker/ScriptCache/"
    "$HOME/.var/app/com.google.Chrome/config/google-chrome/Profile [0-9]/File System/"
    "$HOME/.var/app/com.spotify.Client/cache/"
    "$HOME/.var/app/com.visualstudio.code/cache/"
    "$HOME/.var/app/com.visualstudio.code/config/Code/Cache/"
    "$HOME/.var/app/com.visualstudio.code/config/Code/CachedData/"
    "$HOME/.var/app/com.visualstudio.code/config/Code/CachedExtensionVSIXs/"
    "$HOME/.var/app/com.discordapp.Discord/config/discord/Cache/"
    "$HOME/.var/app/com.discordapp.Discord/cache/"
    "$HOME/.var/app/org.mozilla.firefox/cache/"
    "$HOME/.var/app/*/cache/"
    "$HOME/.local/share/Trash/"
    "$HOME/.cache/"
    "$HOME/.var/app/com.brave.Browser/cache/*"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Cache/*"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/ShaderCache"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/GrShaderCache"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Crash Reports"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/chrome_debug.log"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Media Cache"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/History"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/History-journal"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Favicons"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Favicons-journal"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Top Sites"
    "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Top Sites-journal"
)

for dir in "${cache_directories[@]}"; do
    if [ -d "$dir" ]; then
        dir_size=$(du -sk "$dir" 2>/dev/null | awk '{print $1}')
        rm -rf "$dir" &>/dev/null
        find "$dir" -type d -empty -delete &>/dev/null
        echo -ne "${COLOR_BLUE}\r\033[K\033[32mFiles in: $dir: $dir_size KB cleaned${COLOR_END}"
        total_savings=$((total_savings + dir_size))
    fi
    sleep 0.05
done

echo -e "${COLOR_WHITE}\n\nDone\n${COLOR_END}"

if [ "$total_savings" -lt 1000 ]; then
    echo -e "${COLOR_GREEN}I have saved you an estimated amount of: ${COLOR_WHITE}$total_savings KB${COLOR_END}"
else
    echo -e "${COLOR_GREEN}I have saved you an estimated amount of: ${COLOR_WHITE}$((total_savings / 1000)) MB${COLOR_END}"
fi

sleep 0.5

echo -e "${COLOR_CYAN}"
echo "▗▖  ▗▖▄   ▄ ▄   ▄  ▄▄▄  ▗▞▀▘▗▞▀▚▖▄▄▄▄  ▐▌   "
echo "▐▛▚▞▜▌█   █  ▀▄▀  █   █ ▝▚▄▖▐▛▀▀▘█   █ ▐▌   "
echo "▐▌  ▐▌ ▀▀▀█ ▄▀ ▀▄ ▀▄▄▄▀     ▝▚▄▄▖█▄▄▄▀ ▐▛▀▚▖"
echo "▐▌  ▐▌▄   █                      █     ▐▌ ▐▌"
echo "       ▀▀▀                       ▀          "
echo "			   Follow on Github!"
echo -e "${COLOR_END}"

