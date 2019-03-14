# SQL Queries
```
source .env/bin/activate

# optional
#edit conf/schema.sql and run
python app/init_db.py

python
import app.db as db
 db = db_handler()
db = db.db_handler()
db.query('select * from user')



```
