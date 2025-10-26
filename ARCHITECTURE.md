# **SnapFinance Architecture**

## **Environment Architecture**

- **Staging Namespace:** Testing environment  
- **Production Namespace:** Live environment  
- **Local Minikube:** Used for local development  
- **Docker Hub:** Used for image distribution  

---

## **CI/CD Pipeline**

1. Checkout code  
2. Build Docker image  
3. Push image to Docker Hub  
4. Deploy to Kubernetes using the image from Docker Hub  
5. Verify application deployment  
6. Credentials securely stored in Jenkins Credentials Store  

---

## **Kubernetes Setup**

- **Namespaces:** `staging`, `production`  
- **Components:** Deployments, NodePort Services  
- **Health Checks:** Liveness and Readiness probes  
- **Resource Management:** Requests and limits defined per pod  

---

## **Security Considerations**

- Image scanning with **Trivy**  
- Credentials managed via **Jenkins Credentials Store**  
- **Kubernetes RBAC** and **Secrets** for access control  
- **Minikube** uses local images to avoid unnecessary network exposure  

---

## **Scalability**

Deployments are configured to support scaling. Example command:

```bash
kubectl scale deployment snapfinance-app --replicas=4 -n staging
