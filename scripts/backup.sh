#!/bin/bash
# Bash Menu Script Example

URL=ubuntu@box-1.cryptoforge.org

PS3='Please enter your choice: '
options=("tar_import" "untar_import" "push" "pull" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "tar_import")
            cmd="tar -cvzf ./backups/import.tar.gz -C ./backups/.lnd ."
            echo $cmd
            $cmd    
            ;;

        "untar_import")
            cmd="tar -xzvf import.tar.gz"
            echo $cmd
            $cmd 

            cmd="mv import .lnd"
            echo $cmd
            $cmd       
            ;;

        "push")
            cmd="scp -i ~/.ssh/box -r ./backups/import.tar.gz $URL:/box/import.tar.gz"
            echo $cmd
            $cmd            
            ;;

        "pull")
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