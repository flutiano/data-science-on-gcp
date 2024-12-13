#!/bin/bash

# same as deploy_cr.sh
NAME=ingest-flights-monthly
PROJECT_ID=$(gcloud config get-value project)
BUCKET=${PROJECT_ID}-dsongcp

URL=$(gcloud run services describe ingest-flights-monthly --format 'value(status.url)')
echo $URL

# Feb 2015
echo {\"year\":\"2016\"\,\"month\":\"03\"\,\"bucket\":\"${BUCKET}\"\} > /tmp/message

curl -k -X POST $URL \
   -H "Authorization: Bearer $(gcloud auth print-identity-token)" \
   -H "Content-Type:application/json" --data-binary @/tmp/message

