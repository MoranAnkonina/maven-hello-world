FROM maven:3.5.4
WORKDIR /app
COPY app/ ./
RUN mvn clean install –DskipTests


FROM anapsix/alpine-java:8
WORKDIR /app
COPY --from=0 /app/target/*.jar ./
RUN ls –ltr
RUN java -cp *.jar com.mycompany.app.App
