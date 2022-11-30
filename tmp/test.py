pip install requests

python
import requests
import json

email = 'user@example.com'
email = 'user1@example.com'

response = requests.post(
    'http://flask-gcs:5000/users',
    json={'email': email},
)

data = response.json

response = requests.get('http://flask-gcs:5000/users')

response.text
