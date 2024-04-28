import urllib3

http = urllib3.PoolManager()
reponse = http.request('GET', 'https://epayment.sust.edu/fee/credit-fee')
print(reponse.datastudentInfo.department)