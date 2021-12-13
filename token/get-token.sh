#!/bin/bash
kubectl exec -it testcurl -- sh

curl --location --request POST 'http://keycloak.iam/auth/realms/bets/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=kong' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=joe' \
--data-urlencode 'password=joe' \
--data-urlencode 'client_secret=ac12d3df-2254-4de7-b0b6-6e109628a5fe' \
--data-urlencode 'scope=openid'
