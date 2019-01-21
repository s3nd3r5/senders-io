# senders-io
Personal Homepage, Blog, Resume

# run locally
To run this locally you'll just need docker!

`$ ./docker-run.sh` will launch an `nginx` server with the contents of `www` loaded into server and can be accessed at [http://localhost]

# deploy
To deploy run `./deploy.sh` this will require the AWS CLI to be configured properly, so make sure your creds are setup in the environment.

It will also commit and create the `www/version.txt` file with the date of deployment.
