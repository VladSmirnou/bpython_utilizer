## What it does
This script allows me to run bpython instead of the default
Python interpreter in any folder. It doesn't install bpython locally and
doesn't fully shadow the default Python interpreter, so if I don't wanna
install bpython I still can launch the default interpreter.
Check the workflow picture below if you wanna see the complete guide
about how this script works.

## How to make it work
1) Clone this repo in any folder
2) Move the '.bpython_runner.sh' file to the home directory
3) Create an alias in '~/.bashrc' file, for example -> alias "YOU ALIAS HERE"="source $HOME/.bpython_runner.sh"
4) Restart your current session
5) Type the alias that you created earlier in any folder

## The workflow of the script
![screenshot1](workflow.png)

## Notes
1) I use this script by myself and I like to name my 'venv' folders as '.venv', so this
script won't work if you name your 'venv' folders differently
2) I'm using WSL Ubuntu 22.04.3 LTS
3) My current Python version is 3.10.12
