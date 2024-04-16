FROM tomcat:9-jre9
MAINTAINER "thanmayipt@gmail.com"
COPY ./target/todo_app.war /usr/local/tomcat/webapps/
