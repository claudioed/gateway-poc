#!/bin/bash
kubectl exec -it testcurl -- sh

curl --location --request POST 'http://keycloak.iam/auth/realms/bets/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=kong' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=joe' \
--data-urlencode 'password=joe' \
--data-urlencode 'client_secret=3943ae99-59dd-4d8b-87e3-e6129ef4cd71' \
--data-urlencode 'scope=openid'
