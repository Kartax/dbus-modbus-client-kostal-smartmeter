### Installation

+ SSH into the GX device
+ Navigate to the modbus client folder: `cd /opt/victronenergy/dbus-modbus-client`
+ Download the module: `wget https://github.com/Kartax/dbus-modbus-client-kostal-smartmeter/blob/main/Kostal_SmartEnergyMeter.py`
+ Open the file dbus-modbus-client.py in a text editor: `nano dbus-modbus-client.py`
+ Add the instruction `import Kostal_SmartEnergyMeter` behind the other imports
+ Delete python cache: `rm /opt/victronenergy/dbus-modbus-client/__pycache__/dbus-modbus-client.cpython-38.pyc`
+ Restart the GX device via `reboot`

## Usage

Open the GX Webinterface and navigate to Settings -> Modbus TCP Devices and trigger a Scan. It should now be able to find the KSEM. If the automatic detection does not work, go to Devices and press Add, to add the KSEM IP manually.
