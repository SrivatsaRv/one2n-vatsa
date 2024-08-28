# One2N SRE Assignment - Srivatsa
## Goal - Create HTTP Server with /GET endpoint to list S3 Dir Structure

### Part 1

Write an http service in any programming language, which should expose an endpoint GET

` /GET "http://IP:PORT/list-bucket-content/<path>" `

This endpoint should return the content of an S3 bucket path as specified in the request. If no
path is specified, top level content is returned.
For example, if the bucket has:

- dir-1
- dir-2
  - file-1
  - file-2

`http://IP:PORT/list-bucket-content` should return a JSON like `{"content": ["dir1","dir2"]}`

`http://IP:PORT/list-bucket-content/dir1` should return a JSON like `{"content": []}`

`http://IP:PORT/list-bucket-content/dir2` should return a JSON like `{"content":["file1", "file2"]}`


### Part 2
Write a Terraform layout to provision the infrastructure on AWS , and deploy the code for HTTP server


### Evaluation Criteria
- Code quality, test cases, simplicity of code, adherence to language coding standards,etc.
- Quality of Infrastructure code, layouts, deployment topology, configuration and secret management etc.

### Bonus points
- Handle errors for non-existing paths, like `http://IP:PORT/list-bucket-content/non-existing`
- Deploy the service on https
- A short video demo recording / a good readme explaining design decisions, assumptions, etc.

### Note
- If something is unclear, make necessary assumptions and document them in readme.
- Do not overengineer, the entire exercise should not take you more than a day. If it's taking more than a day, stop and submit whatever you can complete within a day.
- For the HTTP service, use any of the languages like Golang, Python, Ruby, NodeJS,
- Java. You can also use any other language of your choice.
- Commit and push your code (http service code + terraform code) in a GitHub repo. Also commit the video demo + screenshots of bucket and API response in the same repo readme file.
- Use a free tier AWS account for deploying the code. Ensure to turn off the machines and other resources if they are not in use.