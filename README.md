# DevOps Challenge – Production

This branch contains the infrastructure, monitoring, and deployment setup for the production environment.  
The goal is to move it to the cloud.

## Folder Structure

```text
ansible
├── ansible.cfg
├── inventory
│   ├── production
│   └── staging
├── playbooks
│   ├── configure_jenkins.yml
│   ├── deploy_app.yml
│   └── setup_monitoring.yml
└── roles
    ├── app
    ├── jenkins
    └── monitoring

kubernetes
├── configmaps
├── ingress
├── manifests
│   ├── production
│   └── staging
└── secrets

monitoring
├── grafana
│   ├── config
│   ├── dashboards
│   └── data
└── prometheus
    ├── config
    │   └── prometheus.yml
    └── data

terraform
├── main.tf
├── outputs.tf
├── variables.tf
└── versions.tf


## Notes
- Terraform is used for cloud infrastructure provisioning.
- Use Ansible playbooks to configure Jenkins on the cloud privision intances, deploy the app, and set up monitoring.
- Kubernetes manifests are separated by environment (production/staging).
- Prometheus and Grafana folders contain configuration and dashboards for monitoring your services.

