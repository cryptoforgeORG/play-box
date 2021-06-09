# Docker Instructions

```
docker build -t cryptoforge-relay -f Dockerfile.relay .

docker login -u cryptoforge
docker tag cryptoforge-relay:latest cryptoforge/cryptoforge-relay:latest  
docker push cryptoforge/cryptoforge-relay:latest 

docker-compose up
```

```
docker build -t n2n2-relay -f Dockerfile.mainnet .

docker login -u cryptoforge
docker tag n2n2-relay:latest cryptoforge/n2n2-relay:latest  
docker push cryptoforge/n2n2-relay:latest 

docker-compose up
```

```
docker build -t sphinx-relay -f Dockerfile.mainnet .

docker login -u cryptoforge
docker tag sphinx-relay:latest cryptoforge/sphinx-relay:latest  
docker push cryptoforge/sphinx-relay:latest 

docker-compose up
```