#!/bin/bash

MODBUS_CLIENT_DIR="/opt/victronenergy/dbus-modbus-client"
MODULE_URL="https://github.com/Kartax/dbus-modbus-client-kostal-smartmeter/blob/main/Kostal_SmartEnergyMeter.py"
FILE_TO_EDIT="dbus-modbus-client.py"
CACHE_PATH="$MODBUS_CLIENT_DIR/__pycache__/dbus-modbus-client.cpython-38.pyc"

echo "Navigating to the modbus client folder..."
cd $MODBUS_CLIENT_DIR || { echo "Directory $MODBUS_CLIENT_DIR not found!"; exit 1; }

echo "Downloading Kostal_SmartEnergyMeter.py..."
wget -q -O Kostal_SmartEnergyMeter.py "$MODULE_URL" || { echo "Failed to download the module!"; exit 1; }

echo "Editing $FILE_TO_EDIT..."
if ! grep -q "import Kostal_SmartEnergyMeter" "$FILE_TO_EDIT"; then
    sed -i "/^import/s/$/\\nimport Kostal_SmartEnergyMeter/" "$FILE_TO_EDIT" || { echo "Failed to modify the file!"; exit 1; }
else
    echo "import Kostal_SmartEnergyMeter already present in $FILE_TO_EDIT."
fi

echo "Deleting Python cache..."
#rm -f $CACHE_PATH || { echo "Failed to delete Python cache!"; exit 1; }

echo "Restarting the GX device..."
#reboot
