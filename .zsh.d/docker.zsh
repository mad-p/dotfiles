alias dc=docker

dcclean() {
  containers=( `docker ps -a -q` )
  if [[ $#containers > 0 ]]; then
    docker rm $containers
  fi
}

dccommit() {
  docker commit -run='{"Cmd":["/bin/sh","-c","/usr/sbin/sshd -D"],"PortSpecs":["2222"]}' $*
}

dcrun() {
  IMAGE_ID=${1:-${IMAGE_ID:-devenv}}
  NAME=`perl -E '{$_=shift;s/:.*//;say}' $IMAGE_ID`
  if [ x`docker ps -q $NAME` != x ]; then
    echo "Container $NAME is already running! Stop it first."
    return 1
  fi
  if [ x`docker ps -q -a $NAME` != x ]; then
    echo "Removed stopped container $NAME."
    docker rm $NAME
  fi
  echo "Running $IMAGE_ID"
  CONTAINER_ID=`docker run -name $NAME -d mad-p/$IMAGE_ID`
  if [ "x$CONTAINER_ID" != "x" ]; then
    echo "IMAGE_ID=$IMAGE_ID"
    echo "CONTAINER_ID=$CONTAINER_ID"
    export IMAGE_ID
    export CONTAINER_ID
    sleep 1
    dcssh $CONTAINER_ID
  fi
}

dcssh() {
  echo "Connecting to ${CONTAINER_ID=${1:-devenv}}"
  CONTAINER_ADDR=`docker inspect $CONTAINER_ID | perl -ne '/"IPAddress": "([\d.]+)"/ and print $1' `
  if [ "x$CONTAINER_ADDR" != "x" ]; then
    echo "CONTAINER_ADDR=$CONTAINER_ADDR"
    echo ssh maeda@$CONTAINER_ADDR -p 2222 -A -Y
    ssh maeda@$CONTAINER_ADDR -p 2222 -A -Y
  else
    echo "Container $CONTAINER_ID not running"
    return 1
  fi
}
