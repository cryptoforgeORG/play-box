# play-box


``` Game Dashboard (Master Client)
http://box-1.cryptoforge.org:8443/

http://game-1.playentertainment.online:8443/
http://game-2.playentertainment.online:8443/
```

``` Relay
https://box-1.cryptoforge.org/connect

http://game-1.playentertainment.online:3000/connect
http://game-2.playentertainment.online:3000/connect
```

``` proxy
https://crt.sh/?q=box-1.cryptoforge.org
```

## Setup

```
1. Build cluster
    1. start_cluster
    2. Wait for tor (getinfo check)
2. Restore
    1. kill relay
    2. push_backup
    3. apply_backup
3. Attach dash
    1. compose_dash
```


## Deployment
To start see [Deploy](ops/ansible/README.md)

## Docker
To start see [Docker](docs/docker.md)

We accept donations! :)
[DONATE](https://bitclout.com/u/pay2play)