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
