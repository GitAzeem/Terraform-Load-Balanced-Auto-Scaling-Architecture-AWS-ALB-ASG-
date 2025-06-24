# Terraform AWS Auto-Scaling Web Infrastructure

[![Terraform Version](https://img.shields.io/badge/terraform-≥1.5.0-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS-≥5.0-FF9900?logo=amazonaws)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![License](https://img.shields.io/badge/license-MIT-428F7E)](LICENSE)

A Terraform module that deploys a highly available, auto-scaling web infrastructure on AWS with:

- 🚀 **Application Load Balancer (ALB)** - Distributes traffic across instances
- ⚖️ **Auto Scaling Group (ASG)** - Automatically scales EC2 instances
- 🛡️ **Security Best Practices** - Network isolation and least-privilege access



## Features

| Component          | Benefits                                                                 |
|--------------------|--------------------------------------------------------------------------|
| **Multi-AZ ALB**   | Traffic distribution across availability zones                          |
| **Auto Scaling**   | Scale-out during peak loads, scale-in during low traffic                |
| **Health Checks**  | Automatic replacement of unhealthy instances                            |
| **Modular Design** | Reusable components for VPC, EC2, and security groups                  |

## Prerequisites

- Terraform 1.5+
- AWS account with admin privileges
- AWS CLI configured (`aws configure`)

## Usage

### 1. Clone Repository
```bash
git clone https://github.com/GitAzeem/Terraform-Load-Balanced-Auto-Scaling-Architecture-AWS-ALB-ASG-.git
cd Terraform-Load-Balanced-Auto-Scaling-Architecture-AWS-ALB-ASG-
