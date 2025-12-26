# 🚀 Terraform AWS Infrastructure – VPC, ELB, ASG, EC2 with User Data

This project sets up a **complete, production-ready AWS infrastructure** using Terraform.

🔧 **What’s Included:**

- ✅ Custom VPC
- ✅ Public & Private Subnets
- ✅ Internet Gateway & Route Tables
- ✅ AWS Load Balancer (ELB) in Public Subnet
- ✅ Auto Scaling Group (ASG) in Private Subnet
- ✅ EC2 Instances with User Data
- ✅ Security Groups
- ✅ Launch Template for EC2

---

## 🗺️ Architecture Overview

             ┌────────────────────────────┐
             │        Internet            │
             └────────────┬───────────────┘
                          │
                  ┌───────▼────────┐
                  │ Internet GW    │
                  └───────┬────────┘
                          │
    ┌────────────────────▼────────────────────┐
    │                VPC                      │
    │                                          │
    │  ┌──────────────┐     ┌──────────────┐   │
    │  │ Public Subnet│     │Private Subnet│   │
    │  │  (ELB)       │     │ (ASG + EC2)  │   │
    │  └──────┬───────┘     └─────┬────────┘   │
    │         │                   │            │
    │  ┌──────▼──────┐      ┌─────▼─────────┐  │
    │  │   ELB       │      │  Auto Scaling │  │
    │  │ (Target EC2)│◄────▶│  Group        │  │
    │  └─────────────┘      └───────────────┘  │
    └──────────────────────────────────────────┘

  

Follow these simple steps to get started with the Terraform project:

## 1. Clone the Repository

git clone https://github.com/Gagan-1808/terraform-project.git  

cd terraform-project  

## 2. Modify Variables

- Open the variables.tf file (or the appropriate variables file).  
- Edit the variables to suit your environment and requirements.  

## 3. Initialize Terraform

- This downloads the necessary provider plugins and sets up the backend.
   
terraform init  

## 4. Review the Planned Changes

- Preview what Terraform will create, update, or destroy.  

terraform plan  

## 5. Apply the Terraform Configuration

- This will create or update the infrastructure as defined.

terraform apply

- You will be prompted to confirm; type yes to proceed.

## 6. Verify the load balancer is created and target group are healthy.  
<img width="940" height="219" alt="image" src="https://github.com/user-attachments/assets/1599cebf-9ec8-4112-b374-d1ddfe66484d" />


## 7. Browser output:
<img width="1366" height="700" alt="image" src="https://github.com/user-attachments/assets/5b5a6450-f513-4acc-9541-cd1d68b3aad0" />


## Optional: Destroy Infrastructure

- When you want to remove all resources created by Terraform:

terraform destroy
