#!/bin/bash
# Slow Transaction Use Case

echo "Running Slow Trx Use Case"
echo ""

COUNTER=0
while [ $COUNTER -lt 20 ]; do

echo "running Slow Transaction $COUNTER of 20 times. Every 3rd Trxn is Slow. Look under \"Business Segment|BROADCOM_MOBILE|Get Users via iOS 8\""
echo ""

  curl -X GET \
    http://localhost:8999/inventory/users \
      -H 'Postman-Token: cda482c9-e1cf-4a8a-9135-e7a1523f94ed' \
      -H 'cache-control: no-cache' \
      -H 'x-apm-bt: t=4F2504E0-4F89-9B0C-0305E82C2301;d=2b6f0cc904d137be2e1730235f5664094b831186;v=1.0;n=ATT;l=3g;g=47.6202268,-122.3490379;a=BROADCOM_MOBILE$bs=BROADCOM_MOBILE;bt=Get Users;p=iOS;pv=8.1'

        sleep 3

  let COUNTER=COUNTER+1
done
