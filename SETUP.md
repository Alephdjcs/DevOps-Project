## **Prerequisites**

* Docker installed  
* Minikube installed and running  
* kubectl CLI configured  
* Jenkins installed (Docker container recomPrerequisitesmended)  
* Docker Hub account (optional for push)

## 

## **Local Kubernetes Setup**

Set up your **local Kubernetes cluster** using **Minikube**, which allows you to deploy and test your application before moving to a cloud environment.  
Local Kubernetes Setup: minikube start  
Verify the cluster is running: kubectl get nodes  
Enable Kubernetes Ingress: minikube addons enable ingress  
Verify the Ingress controller: kubectl get pods \-n kube-system | grep ingress

## 

## **Deploy Application**

kubectl create namespace staging  
kubectl create namespace production  
kubectl apply \-f kubernetes/manifests/staging \-n staging  
kubectl apply \-f kubernetes/manifests/production \-n production

## **Verify**

kubectl get pods \-n staging  
kubectl get pods \-n production  
minikube service snapfinance-service \-n staging  
minikube service snapfinance-service \-n production

## 

## **Jenkins Pipeline Setup**

1. Install plugins: Git, Pipeline, Docker Pipeline, Credentials Binding, Kubernetes CLI.

2. Add credentials:

   * Docker Hub: dockerhub-creds

   * Github: github-token

3. Create Pipeline job, point to repo with Jenkinsfile.

4. ### **Build Scripts**

   Two helper scripts are executed by the pipeline before and after building the Docker image:

   ├── jenkins

   │   ├── Jenkinsfile

   │   ├── plugins.txt

   │   └── scripts

   │       ├── pre\_build.sh     \# Prepares environment before Docker build

   │       └── post\_build.sh    \# Pushes Docker image and cleans workspace

   **pre\_build.sh**

* Cleans previous temporary files  
* Prints environment variables for debugging  
  **Post\_build.sh**  
* Pushes the new Docker image to Docker Hub  
* Performs post-build cleanup  
5. Execute Build Now to test CI/CD.

   Pull the latest code from GitHub  
   Build and tag the Docker image

   Push it to Docker Hub

   Deploy it to Kubernetes via `kubectl apply`

   

