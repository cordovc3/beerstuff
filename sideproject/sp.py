from bs4 import BeautifulSoup
import requests
import urllib

url = "https://www.sideprojectbrewing.com/shop"

headers = requests.utils.default_headers()
headers.update({ 'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'})

req = requests.get(url, headers)

soup = BeautifulSoup(req.content, 'html.parser')

beers = soup.find_all("a", class_="product")


f = open("new_sp", "w")

for beer in sorted(beers):
    title = beer.find("div", class_ = "product-title").get_text().encode('utf-8')
    so = beer.find("div", class_ = "sold-out")
    so_text = so.get_text().encode('utf-8') if so is not None else ""
    f.write(title + " " + so_text + "\n")
