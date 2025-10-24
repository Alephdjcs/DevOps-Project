**SnapFinance Architecture**

**Environment Architecture**

* Staging namespace: Testing environment  
* Production namespace: Live environment  
* Local Minikube for development, Docker Hub for image distribution  
  **CI/CD Pipeline**  
* Checkout code  
* Docker Build  
* Push to Docker Hub  
* Deploy Kubernetes using the image from DockerHub  
* Verify application  
* Credentials stored in Jenkins Credentials   
  **Kubernetes Setup**  
* Namespaces: staging, production  
* Deployments, NodePort services  
* Liveness and readiness probes  
* Resource requests and limits  
  **Security Considerations**  
* Image scanning with Trivy  
* Credentials managed in Jenkins Credentials Store  
* Kubernetes RBAC and Secrets  
* Minikube uses local images to avoid network exposure  
  **Scalability**  
* Deployments configured to allow scaling:  
  *   kubectl scale deployment snapfinance-app \--replicas=4 \-n staging