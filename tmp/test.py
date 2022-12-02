import requests
import json

response = requests.get('http://flask-shillelagh:5000/users')

email = 'user@example.com'
email = 'user1@example.com'
email = 'user3@example.com'

response = requests.post(
    'http://flask-shillelagh:5000/users',
    json={'id': 3, 'email': email},
)

response = requests.put(
    'http://flask-shillelagh:5000/users/3',
    json={'email': email},
)

response.text

data = response.json
