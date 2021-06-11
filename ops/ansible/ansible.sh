#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("start_cluster" "terminate_cluster" "ssh" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "start_cluster")            
            cmd="ansible-playbook -i inventory/hosts playbooks/start-cluster.yml"
            echo $cmd
            $cmd
            ;;
        "terminate_cluster")
            cmd="ansible-playbook -i inventory/hosts playbooks/terminate-cluster.yml"
            echo $cmd
            $cmd
            ;;
        "ssh")
            cmd="ssh -i ~/.ssh/playent.pem ubuntu@game-1.playentertainment.online"
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