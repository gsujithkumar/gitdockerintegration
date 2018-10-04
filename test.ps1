docker container prune -f

docker build -t gitdocker-local-build:"$(git log -1 --format=%h)"  .

docker run -d -p 90:80 gitdocker-local-build:"$(git log -1 --format=%h)"