#!/bin/bash
# Bash Menu Script Example

function_menu_ssh () {
  PS3='Please enter your choice: '
    options=("game_1" "game_2" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "game_1")
                cmd="ssh -i ~/.ssh/playent.pem ubuntu@game-1.playentertainment.online"
                echo $cmd
                $cmd      
                ;;

            "game_2")
                cmd="ssh -i ~/.ssh/playent.pem ubuntu@game-2.playentertainment.online"
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

PS3='Please enter your choice: '
options=("start_cluster" "terminate_cluster" "ssh" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "start_cluster")            
            cmd="ansible-playbook -i ops/ansible/inventory/hosts ops/ansible/playbooks/start-cluster.yml"
            echo $cmd
            $cmd
            ;;
        "terminate_cluster")
            cmd="ansible-playbook -i ops/ansible/inventory/hosts ops/ansible/playbooks/terminate-cluster.yml"
            echo $cmd
            $cmd
            ;;
        "ssh")
            function_menu_ssh
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