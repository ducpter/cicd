# Sử dụng hình ảnh Maven chính thức để xây dựng ứng dụng
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /
COPY . .
RUN mvn clean package -DskipTests

# Sử dụng hình ảnh OpenJDK chính thức để chạy ứng dụng
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /target/hello-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]