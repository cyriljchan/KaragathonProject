from flask import Flask, render_template, Response, url_for, redirect
from detect import *
import os

app = Flask(__name__)

txt = check()
img = image()

@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html', text_result = txt)    

if __name__ == '__main__':
    app.run(host='localhost', port='5000',debug=True)