from flask import Flask, jsonify
import boto3

# Initialize Flask app
app = Flask(__name__)

# Set up S3 client with default region
s3 = boto3.client('s3', region_name='us-east-1')

# Prepare the app rouets this GET call can expose
@app.route('/list-bucket-contents/')
@app.route('/list-bucket-contents/<path:subpath>')

# Function that is tied to the decorator to communicate with S3 bucket and retrieve objects
def list_bucket_content(subpath=''):
    bucket_name = 'srivatsa-bucket'  # Name of the S3 bucket
    
    response = s3.list_objects_v2(Bucket=bucket_name, Prefix=subpath) # Get objects from S3 based on the subpath

    # Checking 2 conditionals - if response does not have Content key, and Content Key itself is empty
    if 'Contents' not in response or not response['Contents']:
        return jsonify({'error': 'Path not found'}), 404

    # Collect all the object keys (filenames)
    filenames = []
    for obj in response['Contents']:
        filenames.append(obj['Key'])

    # Return the list of filenames as JSON
    return jsonify({'content': filenames})

# Custom 404 error handler to take care of paths that we don't provide for
@app.errorhandler(404)
def page_not_found(e):
    return jsonify({'error': 'The requested URL was not found on the server'}), 404

# Run the Flask app
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)