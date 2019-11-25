import requests
from requests.exceptions import ConnectionError
from bs4 import BeautifulSoup
import re
import urllib.parse


def make_scrapper(url):
    parsed_url = urllib.parse.urlparse(url)

    if 'amazon.com' in parsed_url.hostname:
        return AmazonScraper(url)
    elif 'walmart.com' in parsed_url.hostname:
        return WalmartScraper(url)

    return None


class BaseScraper:
    def __init__(self, url,
                 UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0'):
        self.url = url
        self.header = {
            "User-Agent": UA
        }
        self.minimal_url = None
        self.product_id = None
        self.price = None
        self.title = None

    def scrape(self):
        raise NotImplementedError

    def get_id_from_url(self):
        raise NotImplementedError


class AmazonScraper(BaseScraper):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.retailer = 'amazon'

    def scrape(self):
        url = self.url.split('?')[0]
        try:
            resp = requests.get(url, headers=self.header).content
        except ConnectionError:
            return
        soup = BeautifulSoup(resp, 'lxml')

        self.title = soup.find(id='productTitle')
        self.product_id = soup.find('input', id='ASIN').get('value', None)
        regex = re.compile(r'priceblock_.+')
        price = soup.find('span', id=regex)
        if not price:
            price = soup.find('span', class_='offer-price')

        self.price = price
        self.title = self.title.get_text().strip() if self.title else None
        if self.price:
            self.price = self.price.get_text().strip()
            try:
                self.price = float(re.sub(r'[$.]+', '', self.price)) / 100
            except ValueError:
                self.price = None

        parsed_url = urllib.parse.urlparse(url)
        self.minimal_url = urllib.parse.urlunparse(
            ('https', parsed_url.hostname,
             f'/dp/{self.product_id}', '', '', '')
        )

    def get_id_from_url(self):
        url = self.url.split('?')[0]
        match_result = re.search(r'/([A-Z0-9]{10})', url)
        return match_result.group(1)


class WalmartScraper(BaseScraper):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.retailer = 'walmart'

    def scrape(self):
        url = self.url.split('?')[0]
        try:
            resp = requests.get(url, headers=self.header).content
        except ConnectionError:
            return
        soup = BeautifulSoup(resp, 'lxml')

        # Get ID
        self.product_id = self.get_id_from_url()

        # Get title
        title = soup.find('h1', class_='prod-ProductTitle')
        if not title:
            return
        self.title = title.get_text().strip() if title else None

        # Get price
        price = soup.find('span', class_='price-characteristic')
        if not price:
            return
        self.price = float(price['content'])
        parsed_url = urllib.parse.urlparse(url)
        self.minimal_url = urllib.parse.urlunparse(
            ('https', parsed_url.hostname,
             f'/ip/{self.product_id}', '', '', ''))

    def get_id_from_url(self):
        url = self.url.split('?')[0]
        match_result = re.search(r'/(\d{8,10})', url)
        return match_result.group(1)


def test():
    amazon_url = 'https://www.amazon.com/PlayStation-4-Slim-1TB-Console/dp' \
                 '/B071CV8CG2/ref=sr_1_2?keywords=ps4&qid=1572334926&sr=8-2&th=1'
    amazon_scraper = AmazonScraper(amazon_url)

    amazon_scraper.scrape()
    print(amazon_scraper.title)
    print(amazon_scraper.product_id)
    print(amazon_scraper.price)
    print(amazon_scraper.minimal_url)


def test_walmart():
    walmart_url = 'https://www.walmart.com/ip/Instant-Pot-LUX60-V3-6-Qt-6-in-1-Multi-Use-Programmable-Pressure-Cooker-Slow-Cooker-Rice-Cooker-Saut-Steamer-and-Warmer/55505580'
    walmart_scrapper = WalmartScraper(walmart_url)

    walmart_scrapper.scrape()
    print(walmart_scrapper.title)
    print(walmart_scrapper.product_id)
    print(walmart_scrapper.price)
    print(walmart_scrapper.minimal_url)
    print(walmart_scrapper.retailer)


if __name__ == '__main__':
    test_walmart()
