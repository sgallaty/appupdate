This is appupdate.

It's intended to be a reasonably well parameterized update script that works for every steam game on linux.  So far, for me it has.

The config file accepts a number of parameters as such:

--- config.conf---
# Required parameters

# The steam user required to download the app
STEAM_USER="anonymous" 
# The app label, used in various ways
PROGNAME="empyrion"
# the app ID used to download the content from steam
STEAM_APPID="530870"
# the install dir, default being the homedir of the ID running the app.
INSTALL_DIR="$HOME"
# Optional parameters

# the platform argument is used when installing a cross platform windows binary.  It configures the download appropriately 
PLATFORM=""
# the only valid option is windows
# PLATFORM="windows"
# steam password is used whenever the steam ID for the app is not anonymous
STEAM_PASSWORD=""


