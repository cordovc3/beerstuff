from bs4 import BeautifulSoup
import requests
import urllib

url = "https://www.bottleworks.com/shop/?orderby=date"

headers = requests.utils.default_headers()
headers.update({ 'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'})

req = requests.get(url, headers, timeout=60)

soup = BeautifulSoup(req.content, 'html.parser')

beers = soup.find_all("div", class_="astra-shop-summary-wrap")


f = open("new_bottleworks", "w")

for beer in sorted(beers):
    title = beer.find("h2", class_ = "woocommerce-loop-product__title").get_text().encode('utf-8')
    price = beer.find("span", class_ = "price").get_text().encode('utf-8')
    url = beer.find("a", class_ = "ast-loop-product__link").get('href').encode('utf-8')
    f.write(title + " " + price + " " + url + "\n")
