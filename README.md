# python-webapp-cicd

Deploy Python Flask Web Application in Docker Container Using Dockerfile Multi-Stages and GitHub Actions pipeline.

## Description

This repository demonstrates the use of a multistage Dockerfile to build and package a Flask backend application and using GitHub Actions pipeline to deploy container in Docker registry.
Multistage builds are used to optimize the final Docker image size and improve security

## Introduction
Modern application deployments often involve containerizing both the backend and frontend components. This project focuses on using a multistage Dockerfile to efficiently build a Flask backend application, creating a lightweight and secure Docker image.

## Prerequisites

For a better understanding of this project, ensure you have the following prerequisites:

- Linux basics commands : You needs to familiarize with shell commands.
- Docker : You need to have Docker installed on your machine. Visit [Docker's official](https://www.docker.com/get-started/) website to download and install Docker.

## Getting Started

### Dockerfile

The `Dockerfile` in this repository is designed with multistage builds to efficiently build and package the Flask backend application. It uses separate stages for building dependencies and creating the final production image, resulting in a smaller and more secure Docker image.

### GitHub Actions pipeline
 - Automated Workflows: The heart of this project is the GitHub Actions workflow, 
automating everything from infrastructure setup to application deployment. 💻

- The GitHub Actions pipeline defined in `.github/workflows/cicd.yml` automates the deployment process. It triggers on push events to the `main` branch and builds the Docker image, tags it with the commit SHA, and pushes it to the Docker registry.

### Usage

Follow these steps to deploy the Python Flask web application using Docker and GitHub Actions:

1. Clone the Repository:
Clone the repository to your local machine:
```
git clone https://github.com/mansourka06/python-webapp-cicd.git
```

2. Navigate to the Repository:
Move into the python-webapp-cicd directory:
```
cd python-webapp-cicd
```

3. Build the Docker Image:
Build the Docker image using the provided Dockerfile:
```
docker build -t python-webapp .
```

4. Run the Docker Container:
Run the Docker container from the built image:
```
docker run -d -p 5000:5000 python-webapp
```

5. Access the Web Application:
Access the Python Flask web application in your browser at `http://localhost:5000`.

### Setting up github and github actions

- As we can see, we have a [Dockerfile](Dockerfile) in our root directory with which we can build our docker image.

- Let’s add a Github Actions workflow in our project directory. Create a directory named .github and inside that directory create another directory named workflows. All our workflow files will be stored inside this directory. Create a file named [cicd.yml](.github/workflows/cicd.yml) which will make the complete path as`.github/workflows/cicd.yml`, inside we add the [code pipeline](.github/workflows/cicd.yml).

- Now, whenever I push to deploy branch, a new build will be triggered which will build and push the image to docker hub. The workflow is pretty simple and you may also extend it with running tests or performing other actions as per your requirements.

    - You may have noticed we have used `${{ secrets.DOCKERHUB_USERNAME }}` and `${{ secrets.DOCKERHUB_TOKEN }}` in our workflow. Those are the docker hub credential stored in Github Secrets. We cannot publicly expose them because they grant access to our docker hub account.

    - Head over to Github Secrets page from `Settings` > `Secrets and variables` > `Actions` and click on `New repository secret`.

- Our workflow is now ready. Let’s test it by pushing something to the deploy branch. If you are using some other branch, push to the associated branch accordingly.

## Troubleshooting

- To check if the container is running or not you may run the following command:
```
docker ps
```

- To view the logs of the running container run:
```
docker logs <container id> or <container name>
```

## Contributing
Contributions are welcome! If you have any suggestions, improvements, or issues, feel free to open a pull request or an issue in the GitHub repository.
