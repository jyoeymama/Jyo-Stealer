#!/bin/bash

# Jyo Stealer - Ethical Information Collector
# Designed for ethical penetration testing purposes only

# Display Banner
display_banner() {
    echo "==========================================="
    echo "       Jyo Stealer - Ethical Tool"
    echo "        For authorized use only"
    echo "==========================================="
}

# Display GUI Menu
display_menu() {
    echo ""
    echo "1. Gather System Information"
    echo "2. Gather Network Configuration"
    echo "3. Gather User Details"
    echo "4. Save Results to File"
    echo "5. Exit"
    echo ""
}

# Gather System Information
system_info() {
    echo "[*] Gathering System Information..."
    uname -a
    lsb_release -a 2>/dev/null || echo "No lsb_release command found"
}

# Gather Network Configuration
network_info() {
    echo "[*] Gathering Network Configuration..."
    ifconfig || ip a
    echo "Default Gateway:"
    ip r | grep default
}

# Gather User Details
user_info() {
    echo "[*] Gathering User Details..."
    whoami
    echo "Home Directory: $HOME"
    echo "Logged-in Users:"
    w
}

# Save Results to a File
save_results() {
    local file_name="jyo_stealer_results.txt"
    echo "[*] Saving results to $file_name..."
    echo "===== System Information =====" > "$file_name"
    uname -a >> "$file_name"
    lsb_release -a 2>>"$file_name"
    
    echo "===== Network Configuration =====" >> "$file_name"
    ifconfig >> "$file_name" 2>/dev/null || ip a >> "$file_name"
    ip r | grep default >> "$file_name"
    
    echo "===== User Details =====" >> "$file_name"
    whoami >> "$file_name"
    w >> "$file_name"
    
    echo "[*] Results saved to $file_name."
}

# Main Script Logic
main() {
    display_banner
    while true; do
        display_menu
        read -p "Enter your choice: " choice
        case $choice in
            1) system_info ;;
            2) network_info ;;
            3) user_info ;;
            4) save_results ;;
            5) echo "Exiting..."; exit ;;
            *) echo "Invalid choice, try again." ;;
        esac
    done
}

main
