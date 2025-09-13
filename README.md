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
