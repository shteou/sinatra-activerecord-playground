
docker kill sinatra mysql
docker rm sinatra mysql

docker build -t sinatra .
docker network create foo
docker run --network 'foo' --name sinatra -d                                    -p 8080:8080 sinatra
docker run --network 'foo' --name mysql   -d --env MYSQL_ALLOW_EMPTY_PASSWORD=1 -p 3306:3306 mysql:5.6
sleep 10
echo 'CREATE DATABASE test;' | mysql -u root -h 127.0.0.1 
docker exec -it sinatra bundle exec rake db:migrate
