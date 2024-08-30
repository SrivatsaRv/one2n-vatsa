from flask import Flask, jsonify
import logging
import boto3

s3 = boto3.client()

logging.basicConfig(filename='flaskapp.log',level=logging.DEBUG)  ##utilizing logging module in python to capture DEBUG logs to file flaskapp.log

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome to my Flask application!'

@app.route('/hello-world')
def hello_world():
    return 'Hello, World!'

@app.errorhandler(404)   #Custom Error h
def page_not_found(e):
    # Note '404' is the error code for "Page Not Found"
    return jsonify(error=404, text="This route is not supported."), 404

if __name__ == '__main__':
    app.run(debug=True)
