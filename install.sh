#!/bin/bash

MODBUS_CLIENT_DIR="/opt/victronenergy/dbus-modbus-client"
MODULE_URL="https://raw.githubusercontent.com/Kartax/dbus-modbus-client-kostal-smartmeter/main/Kostal_SmartEnergyMeter.py"
FILE_TO_EDIT="dbus-modbus-client.py"
CACHE_PATH="$MODBUS_CLIENT_DIR/__pycache__/dbus-modbus-client.cpython-38.pyc"

echo "Navigating to $MODBUS_CLIENT_DIR..."
cd "$MODBUS_CLIENT_DIR" || { echo "Failed to navigate to $MODBUS_CLIENT_DIR. Exiting."; exit 1; }

echo "Downloading Kostal_SmartEnergyMeter.py from $MODULE_URL..."
wget -q -O Kostal_SmartEnergyMeter.py "$MODULE_URL" || { echo "Failed to download Kostal_SmartEnergyMeter.py. Exiting."; exit 1; }

echo "Editing $FILE_TO_EDIT to add import statement..."
if ! grep -q "import Kostal_SmartEnergyMeter" "$FILE_TO_EDIT"; then
    sed -i "/^import/s/$/\\nimport Kostal_SmartEnergyMeter/" "$FILE_TO_EDIT" || { echo "Failed to modify $FILE_TO_EDIT. Exiting."; exit 1; }
    echo "import Kostal_SmartEnergyMeter added to $FILE_TO_EDIT."
else
    echo "import Kostal_SmartEnergyMeter already exists in $FILE_TO_EDIT."
fi

echo "Deleting Python cache at $CACHE_PATH..."
rm -f "$CACHE_PATH" || { echo "Failed to delete Python cache. Exiting."; exit 1; }

echo "Rebooting the system..."
reboot
