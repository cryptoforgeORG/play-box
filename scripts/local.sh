#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("ssh_game_1" "import_lnd.tar.gz" "reveal" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "ssh_game_1")
            cmd="ssh -i ~/.ssh/playent.pem ubuntu@game-1.playentertainment.online"
            echo $cmd
            $cmd            
            ;;

        "import_lnd.tar.gz")
            cmd="scp -i ~/.ssh/playent.pem -r root@game-1.playentertainment.online:/game/lnd.tar.gz ."
            echo $cmd
            $cmd            
            ;;

        "reveal")
            cmd="tar -xzvf lnd.tar.gz .lnd"
            echo $cmd
            $cmd 
            cmd="cp .lnd/tls.cert ."
            echo $cmd
            $cmd   
            cmd="cp .lnd/data/chain/bitcoin/mainnet/admin.macaroon ."
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