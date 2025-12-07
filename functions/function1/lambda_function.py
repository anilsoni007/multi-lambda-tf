import json
import requests
from bs4 import BeautifulSoup

def lambda_handler(event, context):
    try:
        # Test 1: Make an HTTP request
        response = requests.get("https://example.com")
        html = response.text

        # Test 2: Parse the HTML with BeautifulSoup
        soup = BeautifulSoup(html, "html.parser")

        # Extract page title if exists
        page_title = soup.title.string if soup.title else "No title found"

        # Extract all <a> link texts
        links = [a.get_text(strip=True) for a in soup.find_all("a")]

        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "BeautifulSoup4 layer is working!",
                "page_title": page_title,
                "total_links_found": len(links),
                "sample_links": links[:5]  # return first 5 links
            })
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({
                "error": str(e),
                "message": "Layer NOT working"
            })
        }
