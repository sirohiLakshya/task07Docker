# Use the official OpenJDK image as base image
FROM openjdk:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Java file from the host to the container
COPY Add.java .

# Compile the Java file
RUN javac Add.java

# Run the Java program when the container starts
CMD ["java", "Add"]

