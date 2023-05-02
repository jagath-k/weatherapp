from flask import Flask,flash,render_template,send_file,request,redirect,url_for,session,flash
from flask_session import Session
from flask_mysqldb import MySQL
from otp import genotp
from datetime import date
from datetime import datetime
from cmail import sendmail
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from tokenreset import token
import io
from io import BytesIO
from pywttr import Wttr
import random
app=Flask(__name__)
app.secret_key='norfregorthedon1'
app.config['SESSION_TYPE']='filesystem'
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='admin'
app.config['MYSQL_DB']='weather'
Session(app)
mysql=MySQL(app)
@app.route('/')
def index():
    return render_template('home.html')
@app.route('/registration',methods=['GET','POST'])
def register():
    if request.method=='POST':
        email=request.form['email']
        password=request.form['password']
        cpassword=request.form['cpassword']
        if password==cpassword:
            cursor=mysql.connection.cursor()
            cursor.execute('SELECT email from signup')
            edata=cursor.fetchall()
            if (email, ) in edata:
                flash('MAIL ALREADY EXISTS')
                return render_template('login.html')
            cursor.close()
            otp=genotp()
            subject='THANKS FOR REGISTRATION TO THE APPLICATION'
            body=f'OTP FOR YOUR REGISTRTAION IS--> {otp}'
            sendmail(email,subject,body)
            return render_template('otp.html',otp=otp,email=email,password=password,cpassword=cpassword)
        else:
            flash('PASSWORD NOTEQUAL TO CONFIRM PASSSWORD')
            return render_template('signup.html')
    return render_template('signup.html')
@app.route('/login',methods=['GET','POST'])
def login():
    if session.get('user'):
        return redirect(url_for('home'))
    if request.method=='POST':
        email=request.form['email']
        password=request.form['password']
        cursor=mysql.connection.cursor()
        cursor.execute('select count(*) from signup where email=%s and password=%s',[email,password])
        count=cursor.fetchone()[0]
        if count==0:
            flash('invalid credentials')
            return render_template('login.html')
        else:
            session['user']=email
            return redirect(url_for('home'))
        
    return render_template('login.html')
@app.route('/weather app')
def home():
    if session.get('user'):
        return render_template('weather.html')
    else:
        flash('LOGIN FIRST')
        return redirect(url_for('login'))
@app.route('/logout')
def logout():
    if session.get('user'):
        session.pop('user')
        return redirect(url_for('index'))
    else:
        flash('ALREADY YOU LOGGED OUT')
        return redirect(url_for('login'))
@app.route('/otp/<otp>/<email>/<password>',methods=['GET','POST'])
def otp(otp,email,password):
    if request.method=='POST':
        uotp=request.form['otp']
        if otp==uotp:
            cursor=mysql.connection.cursor()
            lst=[email,password]
            query='insert into signup(email,password)values(%s,%s)'
            cursor.execute(query,lst)
            mysql.connection.commit()
            cursor.close()
            flash('details registered')
            return redirect(url_for('login'))
        else:
            flash('wrong otp')
            return render_template('otp.html',otp=otp,email=email,password=password)
@app.route('/forgetpassword',methods=['GET','POST'])
def forgot():
    if request.method=='POST':
        email=request.form['email']
        cursor=mysql.connection.cursor()
        cursor.execute('select email from signup')
        data=cursor.fetchall()
        if (email,) in data:
            cursor.execute('select email from signup where email=%s',[email])
            data=cursor.fetchone()[0]
            cursor.close()
            subject=f'RESET PASSSWORD FOR {data}'
            body=f'RESET THE PASSWORD USING-->{request.host+url_for("createpassword",token=token(email,120))}'
            sendmail(data,subject,body)
            flash('RESET LINK SENT YOU TO YOUR MAIL SUCCESSFULLY')
            return redirect(url_for('login'))
        else:
            return 'invalid email id'
    return render_template('forgot1.html')
@app.route('/createpassword/<token>',methods=['GET','POST'])
def createpassword(token):
    try:
        s=Serializer(app.config['SECRET_KEY'])
        email=s.loads(token)['user']
        if request.method=='POST':
            npass=request.form['npassword']
            cpass=request.form['cpassword']
            if npass==cpass:
                cursor=mysql.connection.cursor()
                cursor.execute('update signup set password=%s where email=%s',[npass,email])
                mysql.connection.commit()
                return 'PASSWORD CHANGED SUCCESSFULLY'
            else:
                return 'PASSWORD MISMATCHED'
        return render_template('newpassword.html')
    except:
        return 'LINK EXPIRED TRY AGAIN'
@app.route('/forecast',methods=['GET','POST'])
def forecast():
    place='vijayawada'
    wttr=Wttr(place)
    forecast=wttr.en()
    data=forecast.weather
    day1=data[0]
    day2=data[1]
    day3=data[2]

    sunset=day1.astronomy[0].sunset
    sunrise=day1.astronomy[0].sunrise
    temperature=day1.avgtemp_c
    humidity=day1.hourly[0].humidity
    pressure=day1.hourly[0].pressure

    if request.method=='POST':
        place=request.form['city']
        wttr=Wttr(place)
        forecast=wttr.en()
        data=forecast.weather
        day1=data[0]
        day2=data[1]
        day3=data[2]
        year=date.today().year
        month=date.today().month
        day=date.today().day
        date_today=datetime.strftime(date.today(),'%Y%m%d')
        sunset=day1.astronomy[0].sunset
        sunrise=day1.astronomy[0].sunrise
        temperature=day1.avgtemp_c
        humidity=day1.hourly[0].humidity
        pressure=day1.hourly[0].pressure
        if place.lower() in ['banglore','delhi','goa','mumbai','vijayawada']:
            cursor=mysql.connection.cursor()
            print(datetime.now().date())
            cursor.execute('select count(*) from %s where date=%s'%(place,date_today))
            data=cursor.fetchone()
            print(data)
            if data[0]==0:
                query=f'insert into {place} values(%s,%s,%s,%s,%s,%s)'
                cursor.execute(query,(date_today,sunrise,sunset,temperature,humidity,pressure))
                mysql.connection.commit()
    return render_template('forecast.html',day1=day1,day2=day2,day3=day3)
@app.route('/previous1')
def previous1():
    return render_template('drop down.html')
@app.route('/view/<city>',methods=['GET','POST'])
def view_city(city):
    cursor=mysql.connection.cursor()
    cursor.execute(f"select * from {city}")
    data=cursor.fetchall()
    return render_template('previous weather.html',data=data)
app.run(use_reloader=True,debug=True)

