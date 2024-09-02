from flask import Flask, jsonify
import boto3

app = Flask(__name__)

s3 = boto3.client('s3', region_name='us-east-1')

@app.route('/list-bucket-contents/')
@app.route('/list-bucket-contents/<path:subpath>')
def list_bucket_content(subpath=''):
    bucket_name = 'srivatsa-bucket'
    
    if subpath and not subpath.endswith('/'):
        subpath += '/'

    response = s3.list_objects_v2(Bucket=bucket_name, Prefix=subpath, Delimiter='/')
    content = []

    # Handle directories (CommonPrefixes)
    directories = response.get('CommonPrefixes')
    if directories is not None:
        for prefix in directories:
            directory_name = prefix['Prefix'][len(subpath):].rstrip('/')
            content.append(directory_name)

    # Handle files (Contents)
    files = response.get('Contents')
    if files is not None:
        for obj in files:
            if obj['Key'].endswith('/'):
                continue  # Skip directories
            file_name = obj['Key'][len(subpath):]
            content.append(file_name)

    return jsonify({'content': content})

@app.errorhandler(404)
def not_found(e):
    return jsonify(error='The resource could not be found.'), 404

@app.errorhandler(500)
def internal_error(e):
    return jsonify(error='Internal server error.'), 500


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
