import urllib.request
import urllib.error
import json

def test_login():
    url = "http://localhost:8081/api/auth/login"
    data = json.dumps({
        "email": "worker@test.com",
        "password": "123456"
    }).encode("utf-8")
    
    req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/json'})
    try:
        with urllib.request.urlopen(req) as response:
            resp_data = response.read().decode()
            print("Response:", resp_data)
    except urllib.error.HTTPError as e:
        print("HTTP Error:", e.code)
        print("Error details:", e.read().decode())
    except Exception as e:
        print("Exception:", e)

if __name__ == "__main__":
    print("Testing backend connection...")
    test_login()
