#!/bin/bash
function get_descision() {
    local answer
    read answer
    answer="$(echo $answer | tr A-Z a-z)"
    while [ "$answer" != "y" -a "$answer" != "n" ]; do
        echo -n "Type 'y' or 'n' please!: "
        read answer
        answer="$(echo $answer | tr A-Z a-z)"
    done
    if [ $answer == "y" ]; then
        return 0
    fi
    return 1
}

function instl_run_bpython() {
    echo "Installing bpython using pip..."
    python3 -m pip install bpython
    echo "Done!"
    echo "Happy coding!"
    bpython
}

function actv_venv() {
    echo "Activating the [ $PWD/.venv ]..."
    . $PWD/.venv/bin/activate
    echo "Done!"
}

function init_default_pyt_intr() {
    echo "Initializing the default Python interpreter..."
    python3
}

if [ -z "$VIRTUAL_ENV" ]; then
    if ! [ "$(ls -A $PWD | grep '^.venv$')" ]; then
        echo "You don't have the '.venv' folder in the [ $PWD ] directory,"
        echo -n "wanna create it and install && run bpython? [y/n]: "
        get_descision
        res=$?
        if [ $res -eq 0 ]; then
            echo "Creating the '.venv' in [ $PWD ]..."
            python3 -m venv $PWD/.venv
            echo "Done!"
            actv_venv && instl_run_bpython
        elif [ $res -eq 1 ]; then
            init_default_pyt_intr
        fi
    else
        if [ "$(ls $PWD/.venv/bin | grep '^bpython$')" ]; then
            echo "There is the '.venv' folder with the bpython module installed in [ $PWD ]"
            echo "Activating [ $PWD/.venv ] and initializing bpython..."
            . $PWD/.venv/bin/activate
            echo "Happy coding!"
            bpython
        else
            echo -n "There is an inactive '.venv' in the [ $PWD ] but there is no bpython installed, activate '.venv' and install bpython? [y/n]: "
            get_descision
            res=$?
            if [ $res -eq 0 ]; then
                actv_venv && instl_run_bpython
            elif [ $res -eq 1 ]; then
                init_default_pyt_intr
            fi
        fi
    fi
else
    if [ "$(ls $VIRTUAL_ENV/bin | grep '^bpython$')" ]; then  
        echo "bpython is installed in the current [ $VIRTUAL_ENV ], initializing..."
        bpython
    else
        echo -n "There is no bpython installed in the current [ $VIRTUAL_ENV ], wanna install && run it? [y/n]: "
        get_descision
        res=$?
        if [ $res -eq 0 ]; then
            instl_run_bpython
        elif [ $res -eq 1 ]; then
            init_default_pyt_intr
        fi
    fi
fi
