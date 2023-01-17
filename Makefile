build_image:
 docker build -t reactapp:latest .

create_container:
 docker run -d --name reactapp_container -p 8080:8080 reactapp:latest

stop_container:
 docker stop reactapp_container

kill_container:
 docker rm -f reactapp_container
