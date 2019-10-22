import requests
from requests.exceptions import ConnectionError
from bs4 import BeautifulSoup
import re
import urllib.parse


class BaseScraper:
    def __init__(self, url,
                 UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0'):
        self.url = url
        self.UA = UA
        self.minimal_url = None
        self.product_id = None
        self.price = None
        self.title = None

    def scrape(self):
        raise NotImplementedError


class AmazonScraper(BaseScraper):
    def scrape(self):
        url = self.url.split('?')[0]
        headers = {
            "User-Agent": self.UA
        }
        try:
            resp = requests.get(url, headers=headers).content
        except ConnectionError:
            return
        soup = BeautifulSoup(resp, 'lxml')

        self.title = soup.find(id='productTitle')
        self.product_id = soup.find('input', id='ASIN').get('value', None)
        regex = re.compile(r'priceblock_.+')
        self.price = soup.find('span', id=regex)

        self.title = self.title.get_text().strip() if self.title else None
        if self.price:
            self.price = self.price.get_text().strip()
            self.price = float(re.sub(r'[$.]+', '', self.price)) / 100

        parsed_url = urllib.parse.urlparse(url)
        self.minimal_url = urllib.parse.urlunparse(
            ('https', parsed_url.hostname,
             f'/dp/{self.product_id}', '', '', '')
        )


def test():
    url = 'https://www.amazon.com/Nestle-Chocolate-Assorted-Minis-40-Ounce/dp/B005K6ZLSK'
    amazon_scraper = AmazonScraper(url)
    amazon_scraper.scrape()
    print(amazon_scraper.title)
    print(amazon_scraper.product_id)
    print(amazon_scraper.price)
    print(amazon_scraper.minimal_url)


if __name__ == '__main__':
    test()
