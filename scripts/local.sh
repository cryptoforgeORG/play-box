#!/bin/bash
# Bash Menu Script Example

URL=ubuntu@box-1.cryptoforge.org

function_menu_backup () {
  PS3='Please enter your choice: '
    options=("tar_import" "push_import" "pull_export" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "tar_import")
                cmd="tar -cvzf ./backups/import.tar.gz -C ./backups/.lnd ."
                echo $cmd
                $cmd    
                ;;

            "push_import")
                cmd="scp -i ~/.ssh/box ./backups/import.tar.gz $URL:/box/import.tar.gz"
                echo $cmd
                $cmd            
                ;;

            "pull_export")
                cmd="scp -i ~/.ssh/box -r $URL:/box/export.tar.gz ."
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

function_menu_ssh () {
  PS3='Please enter your choice: '
    options=("box" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "box")
                cmd="ssh -i ~/.ssh/box $URL"
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
options=("start_cluster" "terminate_cluster" "ssh" "backup" "quit")
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

        "backup")
            function_menu_backup
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