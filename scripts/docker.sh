#!/bin/bash
# Bash Menu Script Example

function_menu_bash () {
  PS3='Please enter your choice: '
    options=("bash_game" "bash_thunderhub" "bash_relay" "quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "bash_game")
                cmd="docker exec -it game bash"
                echo $cmd
                $cmd          
                ;;
            "bash_thunderhub")
                cmd="docker exec -it thunderhub bash"
                echo $cmd
                $cmd          
                ;;
            "bash_relay")
                cmd="docker exec -it relay bash"
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
options=("bash" "purge" "logs" "kill" "start_mainnet" "push_backup" "apply_backup" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "bash")            
            function_menu_bash 
            ;;
        "purge")
            cmd="docker system prune -a"
            echo $cmd
            $cmd
            ;;
        "logs")
            cmd="docker ps -q | xargs -L 1 docker logs -f"
            echo $cmd
            $cmd            
            ;;
        "kill")
            cmd="docker kill $(docker ps -q)"
            echo $cmd
            $cmd            
            ;;

        "start_mainnet")
            cmd="docker-compose -f docker-compose.yml up -d"
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
            cmd="rm -rf .lnd"
            echo $cmd
            $cmd
            cmd="tar -xzvf import.tar.gz"
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