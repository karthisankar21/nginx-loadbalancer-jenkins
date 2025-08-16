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
├── Jenkinsfile.git # Jenkins pipeline definition
├── docker-compose.yml
├── assests
| ├── index1.html
| ├── index2.html
| ├── index3.html
| ├── nginx.conf
| ├── loadbalancer.conf
├── sh/
│ ├── run.sh  # Start Nginx + backend containers
│ └── wait.sh # Wait for containers setup time
└── README.md # Project documentation
```
---

## ⚙️ Prerequisites

### For **Linux**
1. **Install Docker Engine**
   ```bash
   sudo apt-get update
   sudo apt-get install docker.io -y
   ```

2. **Install Jenkins**
   ```bash
   sudo apt-get install openjdk-11-jdk -y
   
   curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
   
   sudo apt-get update
   
   sudo apt-get install jenkins -y
   
   ```
   
3. **Verify installation**
   ```bash
    docker --version
    java --version
   ```
   
 ---

### For **Windows**

1. **Install Docker Desktop for Windows**
   - Download from [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - Ensure **WSL 2 backend** is enabled during installation

2. **Install Jenkins on Windows**
   - Download from [Jenkins](https://www.jenkins.io/download/)
   - Run Jenkins as a Windows service

3. **Install WSL (Windows Subsystem for Linux)**
   - Open **PowerShell as Administrator** and run:
     ```powershell
     wsl --install
     ```
   - Restart your system if required
   - By default, Ubuntu will be installed.

4. **Configure Jenkins Service**

   - Press Win + R, type **services.msc**.

   - Find **Jenkins** in the list.

   - Right-click → Properties → Log On tab.

   - Change from Local System Account → This account.

   - Enter your Windows username (type whoami in CMD if unsure).

   - Enter your Windows account password.

      ⚠️ Make sure your account has a password. WSL won’t work if the password is missing.

   - Click Apply → OK, then restart Jenkins.

5. **Verify Docker and WSL integration**
   - From PowerShell:
     ```powershell
     docker --version
     wsl --list --verbose
     ```
   
⚠️ Ensure Jenkins has access to Docker CLI and WSL.

---

🛠 Jenkins Pipeline Setup

1. Clone this repository in Jenkins workspace:
   ```
   git clone https://github.com/karthisankar21/nginx-loadbalancer-jenkins.git

2. Create a new Pipeline Job in Jenkins.

   - In Pipeline script from SCM, select:

         SCM: Git

         Repository URL: https://github.com/karthisankar21/nginx-loadbalancer-jenkins.git

   - Script Path: Jenkinsfile.git

   - Save and Build.

3. Build the pipeline → You will be prompted to select a command to run:

   - start → Start Nginx and backend containers

   - test → Verify load balancing setup

   - clean → Stop and clean up containers

4. Verify in Browser
   Visit http in your browser.
   ```
   http://localhost:8002/
   ```
   To see the updated index.html each time, perform a hard refresh:

    - Windows/Linux: Ctrl + F5 or Ctrl + Shift + R

    - Mac: Cmd + Shift + R
---

✅ Usage

 - To start the load balancer: choose start cmd in Jenkins.

 - To test the setup: choose test cmd.

 - To clean up containers: choose clean cmd.

---

📌 Notes

 - On Windows, Jenkins uses WSL to execute shell scripts.

 - On Linux, scripts run natively with bash.
 
 - Ensure Docker is running before executing the pipeline.

---

⚡ Important:

 - Do not run test immediately after start, as the Docker container may take some time to build. Wait until the containers are ready.
---
