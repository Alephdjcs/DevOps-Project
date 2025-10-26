## **DevOps Challenge – Kubernetes + Docker + Jenkins**

**Objective:** Deploy a sample application using Docker, Kubernetes (Minikube), and a CI/CD pipeline with Jenkins.

**Technologies Used:**

* Docker & Docker Hub  
* Kubernetes (With Minikube)  
* Jenkins  
* CI/CD automation with Jenkinsfile  
* Optional monitoring: Prometheus + Grafana

**Project Structure:**

```text
├── ARCHITECTURE.md  
├── docs  
│   ├── best-practices.md  
│   └── troubleshooting.md  
├── jenkins  
│   ├── Jenkinsfile  
│   ├── plugins.txt  
│   └── scripts  
│       ├── post_build.sh  
│       └── pre_build.sh  
├── kubernetes  
│   └── manifests  
│       ├── production  
│       │   ├── deployment.yaml  
│       │   └── service.yaml  
│       └── staging  
│           ├── deployment.yaml  
│           └── service.yaml  
├── README.md  
└── SETUP.md


Quick Start:

Start Minikube:

minikube start


Start the Jenkins container (replace <container_id> with your container ID):

docker start <container_id>


Configure Minikube to use local Docker images:

eval $(minikube -p minikube docker-env)


Clone the repository.
The application container image is built and pushed automatically through a Jenkins CI/CD pipeline: http://localhost:8090/login?from=%2F
.

Create namespaces and deploy the app:

kubectl create namespace staging
kubectl create namespace production
kubectl apply -f kubernetes/manifests/staging -n staging
kubectl apply -f kubernetes/manifests/production -n production


Access services:

Staging: http://192.168.49.2:32583

Production: http://192.168.49.2:31575

Jenkins CI/CD:

The Jenkins pipeline is configured with a periodic trigger to run every 5 minutes.

It automatically:

Checks out the latest code from UAT.

Builds the Docker image.

Deploys to Kubernetes namespaces (staging and production).

Pipeline logs are stored in jenkins/build_logs/build.log.

Notes:

Use this branch for testing, deployment, and CI/CD purposes.

The main branch contains only the source code for development and local testing.
