docker build -t azka2606/gitaction:v0.0.6 .
docker run --rm -v C:\docker\volumes\runner:/cicd/runner azka2606/gitaction:v0.0.6