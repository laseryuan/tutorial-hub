# https://docs.sqlalchemy.org/en/14/orm/tutorial.html

#  Version Check
import sqlalchemy
sqlalchemy.__version__  

#  Connecting
from sqlalchemy import create_engine
service_account_file='tmp/service_account.json'
sheet_url = 'https://docs.google.com/spreadsheets/d/10yf6SsnDcEcssTiL6LxuX1qpQbACZILUBe1rMo-aUq0/edit#gid=0'
engine = create_engine(
    "gsheets://",
    catalog={
        "users": sheet_url,
    },
    echo=True,
    service_account_file = service_account_file,
)
connection = engine.connect()
query = "SELECT * FROM users"
for row in connection.execute(query):
    print(row)

#  Declare a Mapping
from sqlalchemy.orm import declarative_base

Base = declarative_base()

from sqlalchemy import Column, Integer, String

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    fullname = Column(String)
    nickname = Column(String)

    def __repr__(self):
        return "<User(name='%s', fullname='%s', nickname='%s')>" % (
            self.name,
            self.fullname,
            self.nickname,
        )

# (not workinga) Create a Schem
User.__table__

Base.metadata.create_all(engine)

#  Create an Instance of the Mapped Class
ed_user = User(name="ed", fullname="Ed Jones", nickname="edsnickname")
ed_user.name
ed_user.nickname
str(ed_user.id)

#  Creating a Session
from sqlalchemy.orm import sessionmaker
Session = sessionmaker(bind=engine)
session = Session()

# Adding and Updating Objects
## order
last_user = session.query(User).order_by(User.id.desc()).first()
uid = last_user.id + 1
uid
new_user = User(id=uid, name="ed", fullname="Ed Jones", nickname="edsnickname")
session.add(new_user)

## get by id
our_user = session.query(User).get(3)

## filter
our_user = session.query(User).filter_by(name="ed").first()
our_user.name


session.query(User).filter(User.name.in_(["ed", "fakeuser"])).all()

## (not workinga) batch add
session.add_all(
    [
        User(id=12, name="wendy", fullname="Wendy Williams", nickname="windy"),
        User(id=13, name="mary", fullname="Mary Contrary", nickname="mary"),
        User(id=14, name="fred", fullname="Fred Flintstone", nickname="freddy"),
    ]
)

## update record
our_user.nickname = "othernickname3"

session.commit()

## check session status
session.dirty
session.new
session.rollback()
