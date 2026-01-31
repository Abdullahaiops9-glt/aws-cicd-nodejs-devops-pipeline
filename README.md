# AWS CI/CD Pipeline for Node.js Application (EC2 + CodeBuild + CodeDeploy)

## 📌 Project Overview
This project demonstrates a complete **DevOps-style CI/CD pipeline** using AWS managed services.
The goal was to understand how real-world applications are built, tested, and deployed automatically
using **Linux servers, Bash scripting, and AWS CI/CD services**.

The application is a simple Node.js server deployed on an EC2 instance using AWS CodePipeline.
---

## 🧠 What This Project Proves
- Understanding of **Linux-based EC2 servers**
- Real use of **Bash scripts** for automation
- Hands-on experience with:
  - AWS CodePipeline
  - AWS CodeBuild
  - AWS CodeDeploy
  - Amazon EC2
  - Amazon S3
  - IAM Roles (least privilege)
- End-to-end CI/CD automation from GitHub → Production
---

## 🏗️ Architecture
**Flow:**
Developer (Git Push)
↓
GitHub Repository
↓
AWS CodePipeline
↓
AWS CodeBuild
↓
Amazon S3 (Artifacts)
↓
AWS CodeDeploy
↓
EC2 (Amazon Linux 2)

📌 *All services are configured within AWS Free Tier limits.*
---

## 📁 Project Structure
app/
├── index.js # Node.js application
├── package.json # App dependencies
├── buildspec.yml # CodeBuild instructions
├── appspec.yml # CodeDeploy instructions
├── scripts/
│ ├── install.sh # Install dependencies on EC2
│ └── start.sh # Start Node.js app
├── screenshots/ # Deployment screenshots
└── README.md
---
## Git Push Reference
For pushing the Project from vm to github and for troubleshooting common Git push errors, see [GIT_PUSH_HELP.md]

## ⚙️ EC2 Configuration
- **AMI:** Amazon Linux 2
- **Instance Type:** t2.micro
- **Security Group:**
  - SSH (22) → My IP
  - HTTP (80) → 0.0.0.0/0
- **IAM Role:** EC2-CodeDeploy-Role

### User Data Script
```bash
#!/bin/bash
yum update -y
yum install -y nodejs ruby wget

cd /home/ec2-user
wget https://aws-codedeploy-eu-west-2.s3.amazonaws.com/latest/install
chmod +x install
./install auto

systemctl start codedeploy-agent
systemctl enable codedeploy-agent

---

🔐 IAM Roles Used
Role Name	Purpose
EC2-CodeDeploy-Role	Allows EC2 to receive deployments
CodeBuild-Service-Role	Build and upload artifacts
CodeDeploy-Service-Role	Deploy app to EC2
📌 No access keys or secrets were used — all access is via IAM roles.

🚀 CI/CD Pipeline Stages
Source: GitHub repository
Build: AWS CodeBuild
Deploy: AWS CodeDeploy
Host: Amazon EC2

📸 Screenshots
EC2 instance running
CodePipeline success
CodeDeploy deployment success
Application running in browser

📊 Logs & Monitoring
CloudWatch Logs for CodeBuild and CodeDeploy
EC2 system logs verified during deployment

🧪 Verification
curl http://<EC2_PUBLIC_IP>
Expected Output:
                Hello from Node.js App

🎯 Key Learnings
How CI/CD works in real production systems
Importance of IAM roles and least privilege
Difference between build-time and deploy-time automation
Why infrastructure should be automated, not manual

🔮 Future Improvements
Add environment separation (dev/staging/prod)
Add automated tests in CodeBuild
Containerize app using Docker
Deploy using ECS or EKS

📎 Maintainer
Abdullah



