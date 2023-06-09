from flask import Flask, redirect, request, url_for, render_template
from mysql import connector

app = Flask(__name__)

db = connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = '',
    database = 'db_akademik'
)

if db.is_connected():
    print('Welcome to DB Akademik!')

@app.route('/')
def home():
    return render_template('form.html')

@app.route('/input_data', methods=['post'])
def input_data():
    nim = request.form['nim']
    nama = request.form['nama']
    alamat = request.form['alamat']
    cursor = db.cursor()
    cursor.execute(
        'INSERT INTO tbl_mahasiswa (nim, nama, alamat) VALUES (%s,%s,%s)', (nim,nama,alamat)
    )
    db.commit()
    return render_template('form.html')

@app.route('/lihat_data')
def lihat_data():
    cursor = db.cursor()
    cursor.execute(
        'SELECT * FROM tbl_mahasiswa'
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('lihatdata.html', hasil=result)

if __name__ == "__main__":
    app.run(debug=True)