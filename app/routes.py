from app import app
from flask import g, render_template, redirect, url_for, request, session
from app.db import db_handler
from app.utils import hash_sha1

def get_db():
    if 'db' not in g:
        g.db = db_handler()
    return g.db

@app.teardown_appcontext
def teardown_db(exception):
    db = g.pop('db', None)
    if db is not None:
        db.close()

@app.route('/')
@app.route('/index')
def index():
    title="MyApp - Welcome!"
    return render_template('index.html', title=title)

@app.route('/users')
def users():
    title="MyApp - List users"
    if session['username']:
        db = get_db()
        users = db.query("SELECT * from user")
        return render_template('users.html', title=title, users=users)
    else:
        return redirect(url_for('login'))

@app.route('/adduser', methods=['POST', 'GET'])
def add_user():
    title="MyApp - Add a new user"
    error = None
    msg = None
    if session['username']:
        if request.method=='POST':
            firstname = request.form['firstname']
            lastname = request.form['lastname']
            email = request.form['email']
            username = request.form['username']
            passwd = request.form['password']
            if firstname is None or lastname is None or email is None or username is None or passwd is None:
                error = 'All fields are mandatory.'
            else:
                passwd_hash = hash_sha1(passwd) 
                db = get_db()
                db.add_user(username, passwd_hash, firstname, lastname, email)
                msg = 'User was successfully added!'
        return render_template('adduser.html', title=title, msg=msg, error=error)
    else:
        return redirect(url_for('login'))

@app.route('/login', methods=['POST', 'GET'])
def login():
    title="MyApp - Login"
    error = None
    if request.method=='POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = hash_sha1(password) 
        db = get_db()
	# custom query
        stored_password = db.get_user_password(username)
        if stored_password != hashed_password:
            error = 'Invalid Credentials. Please try again.'
        else:
            session['username'] = username
            return redirect(url_for('index'))
    return render_template('login.html', title=title, error=error)

@app.route('/logout')
def logout():
    title="MyApp - Logout"
    g.username = None
    session['username'] = None
    return render_template('logout.html', title=title)

@app.route('/ex1')
def ex1():
    title = "My App - Example 1"
    user = {'username': 'Test'}
    posts = [
        {
            'author': {'username': 'Rambo'},
            'body': 'Beautiful day in Geneva!'
        },
        {
            'author': {'username': 'Susan'},
            'body': 'I like trains!'
        }
    ]
    return render_template('ex1.html', title=title, user=user, posts=posts)

@app.route('/animes')
def animes():
    title="Your anime list!"
    db = get_db()
    animes = db.query("SELECT * from anime")
    return render_template('animes.html', title=title, animes=animes) 
    
@app.route('/addanime', methods=['POST', 'GET'])
def add_anime():
    title="Nani - Add a new anime"
    error = None
    msg = None
    if session['username']:
        if request.method=='POST':
            duration = request.form['duration']
            date = request.form['date']
            grade = request.form['grade']
            original_title = request.form['original_title']
            original_language = request.form['original_language']
            age = request.form['age']
            
            if duration is None or date is None or grade is None or orignal_title is None or orignal_language is None:
                error = 'All fields are mandatory.'
            else:
                db = get_db()
                db.add_anime(duration, date, grade, original_title, original_languae)
                msg = 'Anime. was successfully added!'
        return render_template('addanime.html', title=title, msg=msg, error=error)
    else:
        return reidrect(url_for('login'))
        
@app.route('/studio')
def studio():
    title="Studios"
    db =db_db()
    studio = db.query('SELECT * from studio')
    return render_template('studio.html', title=title, studio=studio)
    
    