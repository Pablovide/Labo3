cd .\FooBarAPI
docker build -t imagefoobarapi -f Dockerfile .
docker run -d -p 8080:80 imagefoobarapi --name containerfoobarapi
