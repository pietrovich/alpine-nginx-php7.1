#!/usr/bin/env sh
set -e

FILES=/prepare/*
for f in $FILES
do

  DEST=$(head -n 1 $f)
  DEST_DIR=$(dirname $DEST)

  if [ ! -d ${DEST_DIR} ]; then
      mkdir -p ${DEST_DIR}
  fi

  if [ $f == "/prepare/nginx.conf" ]; then
      tail -n +2 $f | cat > $DEST
      sed -i "s/root.\+/root ${SERVER_NAME}/g" $f
      sed -i "s/server_name.\+/server_name ${SERVER_NAME}/g" $f
  else
      tail -n +2 $f | envsubst > $DEST
  fi


done



exec "$@"