#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("push_backup_1" "push_backup_2" "pull_backup_1" "pull_backup_2" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "push_backup_1")
            cmd="scp -i ~/.ssh/playent.pem -r ./backups/import.tar.gz ubuntu@game-1.playentertainment.online:/game/import.tar.gz"
            echo $cmd
            $cmd            
            ;;

        "push_backup_2")
            cmd="scp -i ~/.ssh/playent.pem -r ./backups/import.tar.gz ubuntu@game-2.playentertainment.online:/game/import.tar.gz"
            echo $cmd
            $cmd            
            ;;

        "pull_backup_1")
            cmd="scp -i ~/.ssh/playent.pem -r ubuntu@game-1.playentertainment.online:/game/export.tar.gz ."
            echo $cmd
            $cmd            
            ;;

        "pull_backup_2")
            cmd="scp -i ~/.ssh/playent.pem -r ubuntu@game-2.playentertainment.online:/game/export.tar.gz ."
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