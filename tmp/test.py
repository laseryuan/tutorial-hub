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


headers = {
    'Content-Type': 'multipart/form-data',
}

file_path = 'tests/support/fixtures/test.png'
f = open(file_path, 'rb')
f.close()

files = {
    "avatar" : ("avatar_file.png", open(file_path, "rb"), "image/png"),
    #  'avatar': open(file_path, 'rb'),
}

response = requests.post(
    'http://flask-shillelagh:5000/users/1/avatar',
    files=files
)

response.text

data = response.json
