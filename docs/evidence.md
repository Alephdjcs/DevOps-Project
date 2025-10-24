# Evidence of Working Solution

This document provides proof that the SnapFinance solution is fully functional.

## Successful Deployments
- Include screenshots of deployed applications in both staging and production namespaces.
- Example: `staging_screenshot.png`, `production_screenshot.png`.

## Pipeline Execution Logs
- Attach or reference Jenkins pipeline execution logs.
- Example: `logs/jenkins_pipeline.log`.

## Application Running in Kubernetes
- Show the pods and services are running correctly:
```bash
kubectl get pods -n staging
kubectl get pods -n production
kubectl get svc -n staging
kubectl get svc -n production
```

Include any relevant output screenshots or logs to demonstrate the environment is working as expected.

