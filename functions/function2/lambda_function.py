import json
import requests   # This will fail if the requests layer is not working

def lambda_handler(event, context):
    try:
        response = requests.get("https://httpbin.org/get")
        
        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Requests layer is working!",
                "response_status": response.status_code,
                "response_body": response.json()
            })
        }
    
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({
                "error": str(e),
                "message": "Requests layer NOT working"
            })
        }
