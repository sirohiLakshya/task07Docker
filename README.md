# Java Application Deployment with Docker and Jenkins

This guide outlines the process of creating a simple Java application, Dockerizing it, setting up a Jenkins pipeline, and deploying the setup.

## Step 1: Create a Simple Java Application

Created a Java file named `Add.java`.

## Step 2: Create a Dockerfile

Create a Dockerfile in the same directory as your Java file with the following content:
 ```
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
```

## Step 3: Create a Jenkinsfile

Created a Jenkinsfile in your project's root directory.

### - Test Stage:

- This stage is named "Test", but it actually checks if Docker is available.
- The sh command executes a shell command. In this case, it runs ``` sudo docker info ```.
- By running ``` sudo docker info ```, the pipeline checks if Docker is installed and available on the Jenkins server. The ```sudo``` command is used to execute the docker command with elevated privileges.
- If Docker is available, the pipeline proceeds to the next stage. Otherwise, it will fail at this stage.

### - Build Stage:

- This stage is named "Build".
- The ``` sh ``` command builds a Docker image from a Java file using the ```docker build``` command.
- The ```-t my-java-app ``` flag tags the Docker image with the name ``` my-java-app ```.
- The ```.``` at the end of the command specifies the build context, which is the current directory where the Dockerfile resides.

### - Deploy Stage:

- This stage is named "Deploy".
- The ```sh``` command runs a Docker container using the Docker image built in the previous stage.
- The ```-d``` flag runs the container in detached mode, meaning it runs in the background.
- The ```--name my-java-container``` flag assigns a name ```my-java-container``` to the container.
- After running the container, the ```sh``` command fetches the output of the Java application by executing ```docker logs my-java-container```. This command retrieves the logs of the container named ```my-java-container```, allowing you to see the output of the Java application.

## Step 4: Set Up Jenkins Pipeline
Set up a Jenkins pipeline using the Jenkinsfile created in the previous step. Configure Jenkins to fetch your source code repository and execute the pipeline when changes are detected.

## Step 5: Deploy the Setup
Run the Jenkins pipeline to build the Docker image and deploy the Java application container.
