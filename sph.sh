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

# start android or iOS virtual device
function va {
echo '-->  Type va -l (to list devices android and iOS)'
echo '-->  Type va -a <deviceName> (to start ANDROID) example: va -a Android_4.1'
echo '-->  Type va -I <deviceName> (to start IOS) example: va -i “iPhone 8 (11.2) [BD876937-82DD-4F08-8F8E-B1FC18DDD091]”'
echo '---> Piping your command to emulator:'
if test "$1" == "-l"
then
	startingPoint=$(pwd)
	cd ~/Library/Android/sdk/emulator && ./emulator -list-avds
	xcrun instruments -s devices | grep "iPhone"
	cd $startingPoint
else
	if test "$1" == "-a"
	then
	cd ~/Library/Android/sdk/emulator && ./emulator -avd "$2"
	elif test "$1" == "-i"
	then
	xcrun instruments -w "$2"
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
