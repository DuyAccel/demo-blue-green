#!/bin/sh
export $(cat .env | xargs)
oc apply -k overlays/production
./routing.sh --svc-main $VERSION:100 \
  --route $ROUTE \
  --host $HOST \
  --namespace $NAMESPACE \
  --port $PORT
