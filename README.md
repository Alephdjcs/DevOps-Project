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


**Quick Start:**

1. Clone the repository.  
   The application container image is **built and pushed automatically** through a Jenkins CI/CD pipeline manually, [http://localhost:8090/login?from=%2F](http://localhost:8090/login?from=%2F)   
2. Configure Minikube to use local Docker images:

    eval $(minikube \-p minikube docker-env)  
3. Create namespaces and deploy the app:

   kubectl create namespace staging  
   kubectl create namespace production  
   kubectl apply \-f kubernetes/manifests/staging \-n staging  
   kubectl apply \-f kubernetes/manifests/production \-n production  
4. Access services:

   * Staging: http://192.168.49.2:32583

   * Production: http://192.168.49.2:31575

