#!/bin/bash
# Bash Menu Script Example

function_menu_bash () {
  PS3='Please enter your choice: '
    options=("bash_proxy" "bash_relay" "bash_game" "bash_thunderhub" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "bash_relay")
                cmd="docker exec -it relay bash"
                echo $cmd
                $cmd          
                ;;

            "bash_proxy")
                cmd="docker exec -it proxy sh"
                echo $cmd
                $cmd          
                ;;

            "bash_game")
                cmd="docker exec -it game bash"
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

function_menu_logs () {
  PS3='Please enter your choice: '
    options=("logs_relay" "logs_proxy" "logs_thunderhub" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "logs_relay")
                cmd="docker logs --follow relay"
                echo $cmd
                $cmd            
                ;;

            "logs_proxy")
                cmd="docker logs --follow proxy"
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
}

function_menu_backup () {
  PS3='Please enter your choice: '
    options=("tar_export" "untar_import" "pull_backup" "push_backup" "apply_backup" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "tar_export")
                cmd="tar -cvzf ./export.tar.gz -C ./.lnd ."
                echo $cmd
                $cmd    
                ;;

            "untar_import")
                cmd="mkdir -p /box/.lnd"
                echo $cmd
                $cmd 

                cmd="tar -xzvf import.tar.gz -C /box/.lnd"
                echo $cmd
                $cmd 

                cmd="rm -rf import.tar.gz"
                echo $cmd
                $cmd       
                ;;

            "pull_backup")
                cmd="export CTR_ID=$(docker ps -q -f name=relay)"
                echo $cmd
                $cmd  
                cmd="docker cp $CTR_ID:/relay/export.tar.gz /box/export.tar.gz"
                echo $cmd
                $cmd            
                ;;

            "push_backup")
                cmd="export CTR_ID=$(docker ps -q -f name=relay)"
                echo $cmd
                $cmd   
                cmd="docker cp /box/import.tar.gz $CTR_ID:/relay/import.tar.gz"
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

function_menu_docker () {
  PS3='Please enter your choice: '
    options=("compose_relay" "compose_game" "compose_thunderhub" "kill_relay" "kill_game" "kill_thunderhub" "ps" "prune" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "compose_relay")
                cmd="docker-compose -f docker-compose.yml up -d"
                echo $cmd
                $cmd          
                ;;

            "compose_game")
                cmd="docker-compose -f docker-compose.game.yml up -d"
                echo $cmd
                $cmd          
                ;;

            "compose_thunderhub")
                cmd="docker-compose -f docker-compose.thunderhub.yml up -d"
                echo $cmd
                $cmd          
                ;;

            "kill_relay")
                cmd="docker kill relay"
                echo $cmd
                $cmd          
                ;;

            "kill_game")
                cmd="docker kill game"
                echo $cmd
                $cmd          
                ;;

            "kill_thunderhub")
                cmd="docker kill proxy"
                echo $cmd
                $cmd   
                cmd="docker kill thunderhub"
                echo $cmd
                $cmd            
                ;;

            "ps")
                cmd="docker ps"
                echo $cmd
                $cmd             
                ;;

            "prune")
                cmd="docker system prune -a"
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

function_menu_kill () {
  PS3='Please enter your choice: '
    options=("game" "dash" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "game")
                cmd="docker kill $(docker ps -q)"
                echo $cmd
                $cmd          
                ;;

            "dash")
                cmd="docker kill proxy"
                echo $cmd
                $cmd   
                cmd="docker kill thunderhub"
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
options=("bash" "docker" "backup" "logs" "git_pull" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "bash")            
            function_menu_bash 
            ;;

        "docker")
            function_menu_docker
            ;;

        "backup")            
            function_menu_backup
            ;;

        "logs")
            function_menu_logs          
            ;;

        "git_pull")
            cmd="git pull"
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