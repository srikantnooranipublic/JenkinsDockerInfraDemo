echo "Sorry this UC is not ready yet ..."
exit

#Error Transaction
echo "Running Error Use Case"
echo ""
curl -X GET \
  http://localhost:9999/inventory/printers \
  -H 'Postman-Token: 1963ff39-b9c5-41fd-8b03-9a2c85b269c4' \
  -H 'cache-control: no-cache' \
  -H 'x-apm-bt: t=4F2504E0-4F89-9B0C-0305E82C2301;d=2b6f0cc904d137be2e1730235f5664094b831186;v=1.0;n=ATT;l=3g;g=47.6202268,-122.3490379;a=BROADCOM_MOBILE$bs=BROADCOM_MOBILE;bt=Get Printers;p=iOS;pv=8.1'
