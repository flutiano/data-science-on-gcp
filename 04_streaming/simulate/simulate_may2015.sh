#!/bin/bash
python3 simulate.py --project $(gcloud config get-value project) --startTime '2015-07-01 00:00:00 UTC' --endTime '2017-08-31 00:00:00 UTC' --speedFactor 60
