#!/usr/bin/env python3
import requests
import json
# GMT ID: 173314
# GST ID: 171902 Solana
# GST ID: 174761 BSC
apikeys = json.load(open('./config.json'))
bark = apikeys["bark"]
cryptorank = apikeys['cryptorank']
url = "https://api.cryptorank.io/v1/currencies?api_key={}".format(cryptorank)
gmt_id  = "173314"
sgst_id = "171902"
bgst_id = "174761"
req = requests.get(url, params={
    "ids": "{},{},{}".format(gmt_id, sgst_id, bgst_id)
})
result = req.json()
gmt = result['data'][0]
gmt_price = gmt['values']['USD']['price']
sgst = result['data'][1]
sgst_price = sgst['values']['USD']['price']
bgst = result['data'][2]
bgst_price = bgst['values']['USD']['price']
price_string = "GMT: {:.3f}\nsGST: {:.3f}\nbGST: {:.3f}".format(gmt_price, sgst_price, bgst_price)
push_to_url = "https://api.day.app/{}/".format(bark) + price_string
requests.post(push_to_url)
