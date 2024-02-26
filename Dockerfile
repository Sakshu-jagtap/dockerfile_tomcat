

FROM tomcat:8.5.99-jdk21-corretto-al2
# (Optional) Remove the default webapps directory
WORKDIR /usr/local/apache-tomcat-8.5.99/
# Copy your WAR file into the webapps directory of Tomcat
COPY /var/lib/jenkins/workspace/demo/target/*.war webapps/

# (Optional) Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
