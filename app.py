from flask import Flask, render_template, request, json
from flaskext.mysql import MySQL

app = Flask(__name__)
# export FLASK_ENV=development
# app.secret_key = "CS4400_Final_Project"
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'bank_management'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

conn = mysql.connect()
cursor = conn.cursor()


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/create_corporation")
def create_corporation():
    return render_template("create_corporation.html")


@app.route("/manage_users")
def manage_users():
    return render_template("manage_users.html")


@app.route("/view_stats")
def view_stats():
    return render_template("view_stats.html")


@app.route("/api/create_corporation", methods=['POST'])
def createCorporation():
    _corpID = request.form['corpID']
    _lName = request.form['lName']
    _sName = request.form['sName']
    _rAssets = request.form['rAssets']

    cursor.callproc('create_corporation', (_corpID, _sName, _lName, _rAssets))

    data = cursor.fetchall()
    if len(data) == 0:
        conn.commit()
        return json.dumps({'message': 'Success'})
    else:
        return json.dumps({'error': str(data[0])})


# @app.route('/display_corporation_stats')
# def displayCorporationStats():
#     return display_table("display_corporation_stats")


# def display_table(table):
#     cursor.execute("select * from " + table)
#     rows = list(cursor.fetchall())
#     cols = []
#     for col in cursor.description:
#         cols.append(col[0])
#     return render_template('display_table.html', title=table, rows=rows, cols=cols)
