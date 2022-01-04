# play-box


``` proxy
https://crt.sh/?q=box-1.cryptoforge.org
```

``` relay
https://box-1.cryptoforge.org/connect
```

``` game (master-client)
http://box-1.cryptoforge.org:8443/
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