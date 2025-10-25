## **DevOps Challenge – Kubernetes \+ Docker \+ Jenkins**

**Objective:** Deploy a sample application using Docker, Kubernetes (Minikube), and a CI/CD pipeline with Jenkins.

**Technologies Used:**

* Docker & Docker Hub  
* Kubernetes (WIth Minikube)  
* Jenkins  
* Terraform (optional for infrastructure)   
* CI/CD automation with Jenkinsfile  
* Optional monitoring: Prometheus \+ Grafana

**Project Structure:**

danilo@dcer:\~/Documents/devops-challenge$ tree  
├── application  
│   ├── docker-compose.yml  
│   ├── Dockerfile  
│   └── src  
│       └── web  
│           ├── css  
│           │   ├── bootstrap.css  
│           │   ├── flexslider.css  
│           │   ├── font-awesome.min.css  
│           │   ├── icofont.css  
│           │   ├── jquery-ui.css  
│           │   ├── jQuery.verticalCarousel.css  
│           │   ├── owl.carousel.min.css  
│           │   └── owl.theme.default.min.css  
│           ├── fonts  
│           │   ├── flexslider-icon.eot  
│           │   ├── flexslider-icon.svg  
│           │   ├── flexslider-icon.ttf  
│           │   ├── flexslider-icon.woff  
│           │   ├── FontAwesome.otf  
│           │   ├── fontawesome-webfont.eot  
│           │   ├── fontawesome-webfont.svg  
│           │   ├── fontawesome-webfont.ttf  
│           │   ├── fontawesome-webfont.woff  
│           │   ├── fontawesome-webfont.woff2  
│           │   ├── glyphicons-halflings-regular.eot  
│           │   ├── glyphicons-halflings-regular.svg  
│           │   ├── glyphicons-halflings-regular.ttf  
│           │   ├── glyphicons-halflings-regular.woff  
│           │   ├── glyphicons-halflings-regular.woff2  
│           │   ├── icofont.eot  
│           │   ├── icofont.svg  
│           │   ├── icofont.ttf  
│           │   └── icofont.woff  
│           ├── img  
│           │   ├── accordion1.jpg  
│           │   ├── customar-\_area\_bg.jpg  
│           │   ├── header-bg.jpg  
│           │   ├── site-logo.png  
│           │   ├── sliderr1.png  
│           │   ├── vertical\_text\_images1.jpg  
│           │   └── vertical\_text\_images.jpg  
│           ├── index.html  
│           ├── js  
│           │   ├── active.js  
│           │   ├── bootstrap.min.js  
│           │   ├── jquery-3.1.1.min.js  
│           │   ├── jquery.flexslider.js  
│           │   ├── jquery-ui.js  
│           │   ├── jQuery.verticalCarousel.js  
│           │   └── owl.carousel.min.js  
│           ├── responsive.css  
│           └── style.css  
├── ARCHITECTURE.md  
├── docs  
│   ├── best-practices.md  
│   └── troubleshooting.md  
├── jenkins  
│   ├── Jenkinsfile  
│   ├── plugins.txt  
│   └── scripts  
│       ├── post\_build.sh  
│       └── pre\_build.sh  
├── kubernetes  
│   └── manifests  
│       ├── production  
│       │   ├── deployment.yaml  
│       │   └── service.yaml  
│       └── staging  
│           ├── deployment.yaml  
│           └── service.yaml  
├── README.md  
├── SETUP.md  
└── terraform  
    ├── main.tf  
    ├── outputs.tf  
    ├── variables.tf  
    └── versions.tf

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
