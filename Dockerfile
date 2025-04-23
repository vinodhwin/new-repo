FROM openjdk:8-jdk-alpine
RUN addgroup -S vinodhtech && adduser -S vinodhtech -G vinodhtech && mkdir -p /opt/vinodh
WORKDIR /opt/vinodh
COPY target/wezva-springboot-docker-0.1.0.jar app.jar
COPY app.properties app.properties
COPY bootstrap.sh bootstrap.sh
RUN chown -R vinodhtech:vinodhtech /opt/vinodh && chmod +x bootstrap.sh
USER vinodhtech
EXPOSE 8080
ENTRYPOINT ["/bin/sh", "bootstrap.sh"]
