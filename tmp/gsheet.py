# https://github.com/betodealmeida/shillelagh
# https://github.com/betodealmeida/gsheets-db-api
from sqlalchemy import *
from sqlalchemy.schema import *
from sqlalchemy.engine import create_engine


engine = create_engine("shillelagh://")
connection = engine.connect()

table = Table(
    'https://docs.google.com/spreadsheets/d/1_rN3lm0R_bU3NemO0s9pbFkY5LQPcuy1pscv8ZXPtg8/edit#gid=0',
    MetaData(bind=engine),
    autoload=True)
query = select([func.count(table.columns.country)], from_obj=table)
print(query.scalar())  # prints 3.0

# Authenticationg
service_account_file='tmp/service_account.json'
engine = create_engine("gsheets://", service_account_file = service_account_file)

table_url = 'https://docs.google.com/spreadsheets/d/10yf6SsnDcEcssTiL6LxuX1qpQbACZILUBe1rMo-aUq0/edit#gid=0'
table = Table(
    table_url,
    MetaData(bind=engine),
    autoload=True)

query = select([func.count(table.columns.country)], from_obj=table)
print(query.scalar())  # prints 3.0

# Catalog
engine = create_engine(
    "gsheets://",
    catalog={
        "simple_sheet": "https://docs.google.com/spreadsheets/d/1_rN3lm0R_bU3NemO0s9pbFkY5LQPcuy1pscv8ZXPtg8/edit#gid=0",
    },
)
connection = engine.connect()
query = "SELECT * FROM simple_sheet"
for row in connection.execute(query):
    print(row)
dir(tables)
tables.keys

# Get all table names
inspector = inspect(engine)
print(inspector.get_table_names())
