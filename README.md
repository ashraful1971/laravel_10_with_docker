## Installation

This is a simple laravel project with docker file added that you can use to run the laravel project on docker container using some easy steps:

- git pull https://github.com/ashraful1971/laravel_10_with_docker.git
- docker build -t my_laravel .
- docker run -d -p 8080:8000 --name laravel_project my_laravel
- visit http://localhost:8080
- all done!
