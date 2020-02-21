FROM maven:3.5.4
WORKDIR /my-app
COPY my-app/ ./


FROM anapsix/alpine-java:8
WORKDIR /my-app
COPY --from=0 /my-app/target/*.jar ./
RUN ls –ltr
RUN java -cp *.jar com.mycompany.app.App
