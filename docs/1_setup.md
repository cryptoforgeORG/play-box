# Setup box

## PRODUCTION

1. Use ansible to create cluster with box.
2. Restore from backup (Optional)
   1. Stop relay. 
   2. Create backup import for source box.
   3. Import backup into target box.
   4. Start relay.
3. Verify if relay online getinfo.
   1. https://box-1.cryptoforge.org/connect.
4. Build docker container for game using box.sh utility script.
5. Update Lightning Configs
   1.  vim /game/masters-of-conquest-headless/masters-of-conquest-headless_Data/StreamingAssets/config.json
6. Start game.
   1.  Deploy game-client via dashboad http://box-1.cryptoforge.org:8443
   2.  Review moc.log and telegram chat.

## LOCAL
Modify env
```
code /etc/environment

# Add below

# CRYPTOFORGE
PORT=8443
NODE_HOST=0.0.0.0
DASHBOARD_USERNAME=play
DASHBOARD_PASSWORD=play

PHOTON_APP_ID=fa5e21e8-531b-49fe-93ac-4915068825ea
PHOTON_REGION=usw
```

Start Game Module
```
./scripts/box.sh 
2
2
```

Bash Into Game
```
./scripts/box.sh 
2
2

tail -f /var/log/supervisor/game.log 

```
[Local Dashboard](http://0.0.0.0:8443/)