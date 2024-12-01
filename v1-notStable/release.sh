#!/bin/sh

VERSION='new/code-404'
NEW_DEPLOY='green-demo'
OLD_DEPLOY='demo'


sed -i -e "s|{{VERSION}}|${VERSION}|" \
  -e "s|{{NEW_DEPLOY}}|${NEW_DEPLOY}|" \
  -e "s|{{OLD_DEPLOY}}|${OLD_DEPLOY}|" \
  overlays/production/alert/prometheus-rule.yaml

kubectl apply -k overlays/production
kubectl apply -f overlays/production/alert
