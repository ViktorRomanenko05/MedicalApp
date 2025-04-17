FROM eclipse-temurin:17-jdk-slim
# Устанавливаем рабочую директорию
WORKDIR /app
# Копируем необходимые файлы Maven Wrapper и pom.xml
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
# Загружаем зависимости
RUN ./mvnw dependency:go-offline

COPY src ./src

RUN ./mvnw package -DskipTests

# Запуск собранного .jar
ENTRYPOINT ["java", "-jar", "target/medicalapp-0.0.1-SNAPSHOT.jar"]