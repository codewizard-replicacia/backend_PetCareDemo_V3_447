FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_PetCareDemo_V3_447 backend_PetCareDemo_V3_447
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_PetCareDemo_V3_447/target/PetCareDemo_V3-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar PetCareDemo_V3-0.0.1-SNAPSHOT.jar"]