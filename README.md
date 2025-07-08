# AWS Architectures resource allocation using Terraform

This project demonstrates the resource allocation of the following AWS architectures using Terraform.

## 🖼️ Architecture Diagrams

### Frontend Architecture

![Frontend Architecture](/diagrams/aws_frontend.png)

### Backend Architecture

![Backend Architecture](/diagrams/aws_backend.png)

### Cronjob Architecture

![Cronjob Architecture](/diagrams/cron_job.png)

## 🧭 Project Structure

```
AWS-FullStack-Deployment-with-CI-CD/
├── backend/
│   ├── ecr.tf                  # Elastic Container Registry setup
│   ├── ecs_cluster.tf          # ECS Cluster configuration
│   ├── ecs_task_definition.tf  # ECS Task Definition
│   ├── iam.tf                  # IAM roles and policies for ECS
│   ├── main.tf                 # Backend main resources
│   └── variables.tf            # Backend input variables
│
├── ci-cd/
│   ├── backend-codebuild.tf    # CodeBuild for backend CI/CD
│   ├── be-role.tf              # IAM role for backend CodeBuild
│   ├── fe-role.tf              # IAM role for frontend CodeBuild
│   ├── frontend-codebuild.tf   # CodeBuild for frontend CI/CD
│   ├── main.tf                 # CodeBuild triggers and pipelines
│   └── variables.tf            # CI/CD input variables
│
└── frontend/
    ├── cloudfront.tf          # CloudFront distribution
    ├── main.tf                # Frontend main resources
    ├── s3.tf                  # S3 bucket for static hosting
    ├── terraform.tfstate      # State file
    ├── terraform.tfstate.backup
    └── variables.tf           # Frontend input variables

CronJob-AWS/
├── eventbridge.tf         # EventBridge rule for scheduling
├── index.js               # Lambda function logic (Node.js)
├── lambda.tf              # Lambda function resource definition
├── lambda.zip             # Packaged Lambda code
├── main.tf                # Resource composition entry point
├── role.tf                # IAM role and permissions for Lambda
├── terraform.tfstate*     # Terraform state files
└── variables.tf           # Input variables
```

---

## Backend Components

- **ALB + ECS + Fargate**: Auto-scaled containerized backend services.
- **ECR**: Stores Docker images for backend deployment.
- **CodeBuild**: Automates backend builds and deployments from GitHub.
- **Systems Manager**: Manages secure parameters and secrets.
- **Certificate Manager**: Provides SSL certificates for HTTPS.
- **External Domain**: Custom domain mapped to the ALB.

## Frontend Components

- **S3 + CloudFront**: Hosts and serves the static frontend application with global CDN.
- **WAF**: Protects against common web exploits.
- **CodeBuild**: Builds frontend assets on code pushes.
- **Systems Manager**: Stores environment configs and secrets.
- **Certificate Manager**: Handles HTTPS for the frontend.
- **External Domain**: Custom domain routed to CloudFront.

## Cron Job Components

- **EventBridge**: Schedules Lambda function using cron expressions.
- **AWS Lambda**: Executes a script that reads data from DynamoDB and sends an email.
- **DynamoDB**: Holds dynamic data for email logic.
- **SES (Simple Email Service)**: Sends automated emails.
- **IAM**: Provides scoped permissions for the Lambda function.

---

## ⚙️ Features

- 🚀 **Fully automated provisioning** via Terraform
- 🔐 **Secure** with IAM roles, WAF, and Parameter Store
- 🛠 **CI/CD integrated** using AWS CodeBuild with GitHub Webhooks
- 📬 **Scheduled serverless tasks** using EventBridge + Lambda
- 🌐 **Custom domain support** with HTTPS
- 🧱 **Modular structure** for easy maintenance and scalability

---

## ✅ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- AWS CLI configured with sufficient permissions
- A registered domain (e.g., via Route 53 or external DNS)
- GitHub repository with appropriate access

---

## 🚀 Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-repo/aws-fullstack-deployment
   cd aws-fullstack-deployment  # cd cronjob-aws
   ```

2. **Update `variables.tf` in each module** with your values (domain, repo URL, etc.)

3. **Initialize and apply Terraform**

   ```bash
   terraform init
   terraform apply
   ```

---

## 👨‍💻 Developer Workflow

1. Developer pushes code to GitHub
2. GitHub webhook triggers CodeBuild
3. Backend: Docker image is built → pushed to ECR → deployed on ECS
4. Frontend: Static files built → uploaded to S3 → served via CloudFront
5. Cron job runs on a schedule, reads data, and sends email via SES

---
