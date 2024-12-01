#!/bin/sh
export $(cat .env | xargs)

oc apply -k overlays/production

for f in $(ls overlays/production/alert); do 
  sed -e "s|{{ .NewVersion }}|$NEW_VERSION|g" \
    -e "s|{{ .OldVersion }}|$OLD_VERSION|g" \
    -e "s|{{ .NewDeploy }}|$NEW_DEPLOY|g" \
    -e "s|{{ .OldDeploy }}|$OLD_DEPLOY|g" \
    -e "s|{{ .Route }}|$ROUTE|g" \
    overlays/production/alert/"$f" | oc apply -f -
done 
