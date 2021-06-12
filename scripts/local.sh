#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("ssh_game_1" "push_backup" "pull_backup" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "ssh_game_1")
            cmd="ssh -i ~/.ssh/playent.pem ubuntu@game-1.playentertainment.online"
            echo $cmd
            $cmd            
            ;;

        "push_backup")
            cmd="scp -i ~/.ssh/playent.pem -r ./backups/backup_n2n2-relay-0.tar.gz ubuntu@game-1.playentertainment.online:/game/import.tar.gz"
            echo $cmd
            $cmd            
            ;;

        "pull_backup")
            cmd="scp -i ~/.ssh/playent.pem -r ubuntu@relay-1.n2n2.chat:/game/export.tar.gz ."
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