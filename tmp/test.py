import requests
import json

response = requests.get('http://flask-shillelagh:5000/users')

email = 'user@example.com'
email = 'user1@example.com'

response = requests.post(
    'http://flask-shillelagh:5000/users',
    json={'id': 2, 'email': email},
)

response.text

data = response.json
