from flask_mail import Mail, Message
from flask import Flask, render_template, request, redirect, flash, session
from flask import Blueprint
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import os, math
from werkzeug.utils import secure_filename


with open('templates/config.json', 'r') as c:
    params = json.load(c)['params']



localserver =  True
mail = Mail()
app = Flask(__name__)
mail.init_app(app)

app.config["UPLOAD_FOLDER"] = params["upload_location"]
app.config["ALLOWED_EXTENSIONS"] = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}
app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = params['gmail-user']
app.config['MAIL_PASSWORD'] = params['gmail-password']
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail = Mail(app)
if localserver:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_url']
app.secret_key = "super secret key"
db = SQLAlchemy(app)


class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    subject = db.Column(db.String(120), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Posts(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    img_file = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(120), nullable=False)
    timestamp = db.Column(db.String(12), nullable=True)
class Images(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    image = db.Column(db.String(120), nullable=False)
    name = db.Column(db.String(120), nullable=False)
    mimetype = db.Column(db.String(120), nullable=False)

@app.route('/')
def home():
    page = request.args.get('page', 1, type=int)
    post = Posts.query.order_by(Posts.timestamp.desc()).paginate(page = page, per_page=3)
    flash('Message sent successfully!')
    return render_template('index.html', params=params, posts = post)

@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('posts.html', params=params, post=post)

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route('/dashboard', methods=['GET', 'POST'])
def login():
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.all()
        return render_template('dashboard.html', params=params, posts = post)

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username == params['admin_user'] and password == params['admin_password']:
            session["user"] = username
            post = Posts.query.all()
            return render_template('dashboard.html', params=params, posts = post)
    return render_template('login.html', params=params)

@app.route('/edit/<string:id>', methods=['GET', 'POST'])
def edit(id):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            title = request.form.get('title')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            slug = request.form.get('slug')
            date = datetime.now()
            if id == '0':
                post = Posts(title=title, content=content, img_file=img_file, slug=slug, timestamp = date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(id=id).first()
                post.title = title
                post.content = content
                post.img_file = img_file
                post.slug = slug
                post.timestamp = date
                db.session.commit()
                return redirect('/edit/' + id)
                
        post = Posts.query.filter_by(id=id).first()
        return render_template("edit.html", id = id ,params=params,post = post)
@app.route('/delete/<string:id>', methods=['GET', 'POST'])
def delete(id):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(id=id).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')
@app.route('/logout', methods=['GET', 'POST'])
def logout():
    session["user"]=None
    return redirect('/dashboard')

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'GET':
        return render_template('contact.html', params=params)
    else:
        name = request.form.get('name')
        email = request.form.get('email')
        subject = request.form.get('subject')
        message = request.form.get('message')
        
        entry = Contact(name=name, email=email, subject=subject, message=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        msg = Message("Hey, " + name +". Glad to hear from you!", sender=params["gmail-user"], recipients=[email])
        msg.html = "Hello " + name  +", we have received your information and will definitely reply to you as soon as possible.<br><br> Thanks and regards,<br> <b>Harsh</b>"
        mail.send(msg)
        return redirect("/contact")

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in app.config["ALLOWED_EXTENSIONS"]

@app.route('/upload_pic', methods=['GET', 'POST'])
def upload_file():
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            f = request.files['pic']
            if f and allowed_file(f.filename):
                # filename = secure_filename(f.filename)
                # mimetype = f.mimetype
                # img = Images(image = f.read(), name = filename, mimetype = mimetype)
                # db.session.add(img)
                # db.session.commit()
                f.save(os.path.join(app.config["UPLOAD_FOLDER"], secure_filename(f.filename)))
                return redirect('/dashboard')
            else:
                return "Please enter a valid file pic"

if __name__ == '__main__':
    app.run(debug=True)
