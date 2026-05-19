# aws-to-gcp-nextcrm-migration-toolkit
DevOps toolkit to provision NextCRM on AWS and automate its migration to Google Cloud using Terraform, Ansible, Docker, Python, Bash and GitLab CI/CD.

App: https://github.com/juancruzmarzetti/nextcrm-app-fork

------

## Target repository structure

This is the planned structure for the DevOps / IaC / Migration Toolkit.  
The repository is organized to keep AWS source infrastructure, GCP target infrastructure, automation scripts, Ansible configuration and CI/CD workflows clearly separated.

<details>
<summary>View repository tree</summary>

```text
aws-to-gcp-nextcrm-migration-toolkit/
│
├── README.md
├── docs/
│   ├── architecture-overview.md
│   ├── aws-source-architecture.md
│   ├── gcp-target-architecture.md
│   ├── migration-flow.md
│   ├── limitations.md
│   └── cost-control.md
│
├── terraform/
│   ├── aws-source/
│   │   ├── environments/
│   │   │   └── dev/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       ├── providers.tf
│   │   │       ├── backend.tf
│   │   │       └── terraform.tfvars.example
│   │   │
│   │   └── modules/
│   │       ├── network/
│   │       ├── compute/
│   │       ├── database/
│   │       ├── storage/
│   │       └── iam/
│   │
│   ├── gcp-target/
│   │   ├── environments/
│   │   │   └── dev/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       ├── providers.tf
│   │   │       ├── backend.tf
│   │   │       └── terraform.tfvars.example
│   │   │
│   │   └── modules/
│   │       ├── network/
│   │       ├── compute/
│   │       ├── database/
│   │       ├── storage/
│   │       └── iam/
│   │
│   └── shared/
│       └── README.md
│
├── ansible/
│   ├── playbooks/
│   │   ├── deploy-aws-source.yml
│   │   └── deploy-gcp-target.yml
│   ├── roles/
│   │   ├── docker/
│   │   ├── nginx/
│   │   └── nextcrm/
│   └── inventory/
│
├── scripts/
│   ├── aws/
│   │   ├── backup-db.sh
│   │   ├── export-s3.sh
│   │   └── discover-aws.py
│   │
│   ├── gcp/
│   │   ├── restore-db.sh
│   │   ├── import-storage.sh
│   │   └── deploy-images.sh
│   │
│   └── migration/
│       ├── full-migration.sh
│       ├── smoke-tests.sh
│       └── validate-env.sh
│
├── docker/
│   ├── Dockerfile.toolkit
│   └── docker-compose.toolkit.yml
│
└── .gitlab-ci.yml
```

</details>
