```
fwdinghistory --start_time "-1d" --max_events 50000 | jq '.forwarding_events[] | (select(.amt_out == "1"))'

lncli --lnddir=/relay/.lnd/ --macaroonpath=/relay/.lnd/data/chain/bitcoin/mainnet/admin.macaroon listinvoices | jq '.invoices[] | select(.value == "1")'
```