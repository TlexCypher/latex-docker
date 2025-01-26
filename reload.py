from flask import Flask, render_template, send_from_directory
import os
import time
import threading
import subprocess

app = Flask(__name__, template_folder='./templates')

# PDF ファイルを配信するルート
@app.route('/pdf/<filename>')
def serve_pdf(filename):
    return send_from_directory(os.getcwd(), filename)

# HTML ページを表示するルート
@app.route('/')
def index():
    return render_template('index.html')

# tex ファイルをコンパイルする関数
def compile_tex():
    while True:
        subprocess.run(['latexmk', '-pdf', 'main.tex'])
        time.sleep(4)

if __name__ == '__main__':
    thread = threading.Thread(target=compile_tex)
    thread.daemon = True
    thread.start()

    app.run(host='0.0.0.0', port=5000, debug=True)
