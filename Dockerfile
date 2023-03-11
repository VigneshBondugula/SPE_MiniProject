FROM openjdk
COPY ./target/Calculator-MiniProject-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "Calculator-MiniProject-1.0-SNAPSHOT-jar-with-dependencies.jar"]