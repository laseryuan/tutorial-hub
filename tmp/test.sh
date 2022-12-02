curl http://flask-shillelagh:5000/users

pip install requests
python

pytest --ignore=tmp
pytest --ignore=tmp -s -k 'test_get_all_users'
pytest --ignore=tmp -s -k 'test_create_a_user'
