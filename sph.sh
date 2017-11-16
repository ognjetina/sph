# my scripts
alias pip='pip3'
alias python='python3'
alias spes='. env/bin/activate'
alias spr='source ~/.bashrc; echo bash refreshed!'

spj () 
{ 
    if [ "$1" ]; then
        cd ~/Workspace/$1;
    else
        startingPoint=$(pwd);
        cd ~/Workspace;
        echo "Found projects:";
        ls --color=auto;
        cd $startingPoint;
    fi
}
sph () 
{ 
    echo 'All my super project scripts:';
    echo ' - spr			- refresh my bashrc source';
    echo ' - spj			- lists my projects in Workspace folder';
    echo ' - spj <project name>	- jumps to project in Workspace';
    echo ' - spes			- starts virtual enviroment if you are in root folder of your project(and so is the env)'
}


# alias for android virutal device
alias shakedevice='adb shell input keyevent 82'
alias reversedevice='adb reverse tcp:8081 tcp:8081'

function device {
if [ $# -eq 0 ]
  then
    echo '-->  Type device -s To shake the device'
    echo '-->  Type device -r To reverse device TCP 8081'
    echo '---> Type device -c <app-name> To clear dev app data'
fi
if test "$1" == "-s"
then
        adb shell input keyevent 82
        echo '-->  Shake complete'
else
        if test "$1" == "-r"
        then
        adb reverse tcp:8081 tcp:8081
        echo '-->  Reverse complete'
        else
            if test "$1" == "-c"
            then
            adb shell pm clear $2
            echo '-->  Data wiped'
            fi
        fi
fi
}

# start andorid virtual device
function va {
if [ $# -eq 0 ]
  then
echo '-->  Type va -l (to list devices)'
echo '-->  Type va -avd <deviceName> (to start emulator)'
fi
if test "$1" == "-l"
then
        cd ~/Library/Android/sdk/emulator && ./emulator -list-avds
else
        if test "$1" == "-avd"
        then
        cd ~/Library/Android/sdk/emulator && ./emulator "$1" "$2"
        fi
fi
}

#pull screenshot from phone and give it a name as parametar or use default
function ssandroid () {
     
    SCREENSHOT_NAME="$1"
    if [ -z "$SCREENSHOT_NAME" ]
    then
        echo “No name provided screenshot will be named screen.png“
	SCREENSHOT_NAME=screen.png
    fi

    adb shell screencap -p /sdcard/"${SCREENSHOT_NAME}".png
    adb pull /sdcard/"${SCREENSHOT_NAME}".png
    adb shell rm /sdcard/"${SCREENSHOT_NAME}".png
    mv "${SCREENSHOT_NAME}".png ~/Desktop
}
