 

Set-ExecutionPolicy RemoteSigned

#docker rm -f $(docker ps -aq)

docker container prune -f

docker build -t gitdocker-local-build:"$(git log -1 --format=%h)"  .

docker run -d -p 80 gitdocker-local-build:"$(git log -1 --format=%h)"
 