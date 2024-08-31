from flask import Flask, jsonify
import boto3

app = Flask(__name__)

s3 = boto3.client('s3', region_name='us-east-1')

@app.route('/list-bucket-contents/')
@app.route('/list-bucket-contents/<path:subpath>')
def list_bucket_content(subpath=''):
    bucket_name = 'srivatsa-bucket'
    response = s3.list_objects_v2(Bucket=bucket_name, Prefix=subpath)

    if 'Contents' not in response or not response['Contents']:
        return jsonify({'error': 'Path not found'}), 404

    filenames = []
    for obj in response['Contents']:
        filenames.append(obj['Key'])

    return jsonify({'content': filenames})

@app.errorhandler(404)
def page_not_found(e):
    return jsonify({'error': 'The requested URL was not found on the server'}), 404

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)