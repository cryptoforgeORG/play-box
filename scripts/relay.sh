#!/bin/bash
# Bash Menu Script Example


function_menu_logs () {
  PS3='Please enter your choice: '
    options=("log_game" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "log_game")
                cmd="tail -f /var/log/supervisor/game.log"
                echo $cmd
                $cmd          
                ;;
            "quit")
                break
                ;;
            *) 
                PS3="" # this hides the prompt
                echo asdf | select foo in "${options[@]}"; do break; done # dummy select 
                PS3="Please enter your choice: " # this displays the common prompt
                ;;
        esac
    done
}

function_menu_restart () {
  PS3='Please enter your choice: '
    options=("restart_game" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "restart_game")
                cmd="supervisorctl restart game"
                echo $cmd
                $cmd          
                ;;
            "quit")
                break
                ;;
            *) 
                PS3="" # this hides the prompt
                echo asdf | select foo in "${options[@]}"; do break; done # dummy select 
                PS3="Please enter your choice: " # this displays the common prompt
                ;;
        esac
    done
}

function_menu_main () {
  PS3='Please enter your choice: '
    options=("logs" "restart" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "logs")
                function_menu_logs       
                ;;     
            "restart")
                function_menu_restart       
                ;;
            "quit")
                break
                ;;
            *) 
                PS3="" # this hides the prompt
                echo asdf | select foo in "${options[@]}"; do break; done # dummy select 
                PS3="Please enter your choice: " # this displays the common prompt
                ;;
        esac
    done
}

function_menu_main