#!/bin/bash
# Bash Menu Script Example

function_menu_bash () {
  PS3='Please enter your choice: '
    options=("bash_game" "bash_relay" "quit")
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
options=("bash" "reset" "logs" "kill" "start_mainnet" "import_lnd.tar.gz" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "bash")            
            function_menu_bash 
            ;;
        "reset")
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

        "import_lnd.tar.gz")
            cmd="docker cp $(docker ps -q):/game/lnd.tar.gz /game/lnd.tar.gz"
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