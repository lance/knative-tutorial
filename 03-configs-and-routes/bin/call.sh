#!/bin/bash 

set -e 

INGRESSGATEWAY=istio-ingressgateway
IP_ADDRESS="$(minishift ip):$(kubectl get svc $INGRESSGATEWAY --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"

while true
do
  curl -H "Host:greeter.knativetutorial.example.com" $IP_ADDRESS
  echo ""
  sleep .2
done;
