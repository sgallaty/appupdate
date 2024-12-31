#!/bin/sh
# steam dedicated app helper 
# Author: Nox (Nox@monkeypaw.org)
# Note.  Must be run with pwd being the location of the config file, for now.

. ./config.conf

assert()
{
if [ "$1" = "0" ]; then
	return
fi

echo "ERROR ($1): $2"
exit 1
}

hbar()
{
 echo -e "\r-------------------------------------------------------------"
}

hbar

for i in STEAM_USER STEAM_APPID INSTALL_DIR PROGNAME; do
# the bash construct ${!i} allows us to get the value of a variable whose name is the string in $i
	echo "$i:${!i}"
	if [ "${!i}" = "" ]; then 
		echo "ERROR: $i is unset.  Check config."
		exit 1
	fi 
done

PLATFORM_ARG=""
PLATFORM_COMMENT=""

if [ "$PLATFORM" == "windows" ]; then
	PLATFORM_ARG="@sSteamCmdForcePlatformType windows"
        PLATFORM_COMMENT="using windows executables"
fi

hbar

echo "Installing $PROGNAME $PLATFORM_COMMENT (steam app $STEAM_APPID) into $INSTALL_DIR/$PROGNAME"

# if install dir doesn't exist, create it
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
assert $? "cd to $INSTALL_DIR"
$INSTALL_DIR/steamcmd.sh << _EOF
$PLATFORM_ARG
login $STEAM_USER $STEAM_PASSWORD
force_install_dir $INSTALL_DIR/server
app_update $STEAM_APPID validate 
exit
_EOF

assert $? "steam update"

hbar

# steamcmd/steamcmd.sh +login $USER steampassword +force_install_dir directory/you/want/to/install/to* +app_update 108600" validate +exit
