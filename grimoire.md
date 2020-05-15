# CLI Grimoire

## Get the public IP of a customer backend

`dig <backend-hostname>`

## Test if a customer back end is functioning

`curl -vv -k -resolve <public-host>:<port>:<public-backend-ip> https://<public-host>/<path>`

## Connect to a customer's ELB
