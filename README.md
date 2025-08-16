# Nginx Load Balancer with Jenkins Automation

This project demonstrates a simple **Nginx load balancer setup using Docker**, fully automated with a **Jenkins pipeline**.  
The pipeline works on **both Linux and Windows** environments (with WSL support on Windows).

---

## 🚀 Project Overview

- Nginx acts as a **reverse proxy and load balancer** for multiple backend containers.  
- The Jenkins pipeline automates starting, testing, and cleaning up the Docker environment.  
- Compatible with:
  - **Linux agents** (Docker + Jenkins installed natively).
  - **Windows agents** (Docker Desktop + Jenkins + WSL installed).

---

## 📂 Repository Structure
```
nginx-loadbalancer-jenkins/
├── Jenkinsfile # Jenkins pipeline definition
├── sh/
│ ├── start.sh # Start Nginx + backend containers
│ ├── test.sh # Test the load balancer setup
│ └── clean.sh # Stop and clean up containers
└── README.md # Project documentation


---

## ⚙️ Prerequisites

### For **Linux**
1. Install **Docker Engine**  
   👉 [Install Docker on Linux](https://docs.docker.com/engine/install/)
   
3. Install **Jenkins**  
   👉 [Install Jenkins on Linux](https://www.jenkins.io/doc/book/installing/)  

---

### For **Windows**
1. Install **Docker Desktop**  
   👉 [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)  
   - Enable **WSL 2 backend** during setup.
  
2. Install **WSL (Windows Subsystem for Linux)**  
   Open **PowerShell as Administrator** and run:  
   ```powershell
   wsl --install

Restart your system after installation.

3. Install Jenkins for Windows
👉 Jenkins Windows Installer

⚠️ Ensure Jenkins has access to Docker CLI and WSL.

🛠 Jenkins Pipeline Setup

1. Clone this repository in Jenkins workspace:
   ```
   git clone https://github.com/karthisankar21/nginx-loadbalancer-jenkins.git

2. Create a new Pipeline Job in Jenkins.

    In Pipeline script from SCM, select:

        SCM: Git

        Repository URL: https://github.com/karthisankar21/nginx-loadbalancer-jenkins.git

    Script Path: Jenkinsfile.git

3. Build the pipeline → You will be prompted to select a script to run:

    start.sh → Start Nginx and backend containers

    test.sh → Verify load balancing setup

    clean.sh → Stop and clean up containers
   
