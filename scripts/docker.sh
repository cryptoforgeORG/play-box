#!/bin/bash
# Bash Menu Script Example

function_menu_bash () {
  PS3='Please enter your choice: '
    options=("bash_game" "bash_relay" "bash_thunderhub" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "bash_game")
                cmd="docker exec -it game bash"
                echo $cmd
                $cmd          
                ;;

            "bash_relay")
                cmd="docker exec -it relay bash"
                echo $cmd
                $cmd          
                ;;

            "bash_thunderhub")
                cmd="docker exec -it thunderhub sh"
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

function_menu_backup () {
  PS3='Please enter your choice: '
    options=("pull_backup" "push_backup" "apply_backup" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "pull_backup")
                cmd="export CTR_ID=$(docker ps -q -f name=relay)"
                echo $cmd
                $cmd  
                cmd="docker cp $CTR_ID:/relay/export.tar.gz /game/export.tar.gz"
                echo $cmd
                $cmd            
                ;;

            "push_backup")
                cmd="export CTR_ID=$(docker ps -q -f name=relay)"
                echo $cmd
                $cmd   
                cmd="docker cp /game/import.tar.gz $CTR_ID:/relay/import.tar.gz"
                echo $cmd
                $cmd            
                ;;
                
            "apply_backup")
                cmd="mv .lnd/thubConfig.yaml ./thubConfig.yaml"
                echo $cmd
                $cmd
                cmd="mv .lnd/.cookie ./.cookie"
                echo $cmd
                $cmd
                cmd="mv .lnd/v3_onion_private_key ./v3_onion_private_key"
                echo $cmd
                $cmd
                cmd="mv .lnd/tls.cert ./tls.cert"
                echo $cmd
                $cmd
                cmd="mv .lnd/tls.key ./tls.key"
                echo $cmd
                $cmd
                cmd="rm -rf .lnd"
                echo $cmd
                $cmd
                cmd="tar -xzvf import.tar.gz"
                echo $cmd
                $cmd
                cmd="mv thubConfig.yaml .lnd/thubConfig.yaml"
                echo $cmd
                $cmd
                cmd="mv .cookie .lnd/.cookie"
                echo $cmd
                $cmd
                cmd="mv tls.key .lnd/tls.key"
                echo $cmd
                $cmd
                cmd="mv tls.cert .lnd/tls.cert"
                echo $cmd
                $cmd
                cmd="mv v3_onion_private_key .lnd/v3_onion_private_key"
                echo $cmd
                $cmd 
                cmd="rm -rf import.tar.gz"
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
options=("bash" "kill" "purge" "compose_relay" "backup" "compose_dash" "logs_thunderhub" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "bash")            
            function_menu_bash 
            ;;

        "kill")
            cmd="docker kill $(docker ps -q)"
            echo $cmd
            $cmd            
            ;;

        "purge")
            cmd="docker system prune -a"
            echo $cmd
            $cmd
            ;;

        "compose_relay")
            cmd="docker-compose -f docker-compose.yml up -d"
            echo $cmd
            $cmd            
            ;;

        "backup")            
            function_menu_backup
            ;;

        "compose_dash")
            cmd="docker-compose -f docker-compose.thunderhub.yml up -d"
            echo $cmd
            $cmd            
            ;;

        "logs_thunderhub")
            cmd="docker logs --follow thunderhub"
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