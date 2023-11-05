## How to make it work
1) Clone this repo in any folder
2) Move the '.bpython_runner.sh' file to the home directory
3) Create an alias in '~/.bashrc' file, for example -> alias "YOU ALIAS HERE"="source $HOME/.bpython_runner.sh"
4) Restart your current session
5) Type the alias that you created earlier in any folder

## The workflow of the script
[ Check if I'm currently not in a virtual environment ]
    - if I'm not ->
        [ check if the .venv folder is not in the current directory ]
            - if it is not ->
                [ ask if i want to create .venv and install bpython ]
                    - if yes ->
                        [ create .venv, install bpython and run it ]
                    - if not ->
                        [ open the default Python interpreter ]
            - if it is ->
                [ check if there is bpython installed in it ]
                    - if yes ->
                        [ activate .venv and open bpython ]
                    - if not ->
                        [ ask if I want to activate this .venv and install bpython ]
                            if yes -> 
                                [ activate the .venv and install bpython]
                            if not ->
                                [ open the default Python interpreter ]
    - if I'm ->
        [ check if bpython is installed ]
            - if it is ->
                [ run it ]
            - if it is not -> 
                [ ask if I want to install it ]
                    - if yes -> 
                        [ install bpython and open it ]
                    - if not -> 
                        [ open the default Python interpreter ]

## Notes
1) I use this script by myself and I like to name my 'venv' folders as '.venv', so this
script won't work if you name your 'venv' folders differently.
2) I'm using WSL Ubuntu 22.04.3 LTS
