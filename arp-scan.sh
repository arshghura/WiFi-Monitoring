#!/bin/bash

# Set the network interface to monitor
INTERFACE="wlan0"  # Change this to your actual network interface, e.g., wlan0, eth0 etc

# File to store the known MAC addresses, create a text file with any name and copy the path
KNOWN_MAC_FILE="/home/kali/network.txt"

# Function to check if a MAC address is already known
is_known_mac() {
    grep -q "$1" "$KNOWN_MAC_FILE"
}

# Function to notify about a new device
notify_new_device() {
   # echo "New device connected with MAC address: $1" #to test in terminal, remove the # infront of echo
    curl -d "New device connected with MAC address: $1" ntfy.sh/New_Device_Alert
    # Add any notification mechanism you prefer here (e.g., i am using ntfy service)
}

# Continuous monitoring loop
while true; do
    # Perform a new scan
    new_devices=$(sudo arp-scan --interface="$INTERFACE" -l -g | grep -o -E '([0-9A-Fa-f]{2}:){5}([0-9A-Fa-f]{2})' | sort -u)

    # Check for new devices
    while read -r mac; do
        if ! is_known_mac "$mac"; then
            # Notify about the new device
            notify_new_device "$mac"
            # Add the new MAC address to the known list
            echo "$mac" >> "$KNOWN_MAC_FILE"
        fi
    done <<< "$new_devices"

    # Sleep for a minute before the next scan
    sleep 1200
done
