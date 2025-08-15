pipeline {
    agent any

    stages {
        stage('Start Nginx Load Balancer') {
            steps {
                script {
                    runScript('start.sh')
                }
            }
        }

        stage('Wait for Load Balancer') {
            steps {
                script {
                    runScript('wait.sh')
                }
            }
        }

        stage('Test Nginx Load Balancer') {
            steps {
                script {
                    runScript('test.sh')
                }
            }
        }

        stage('Stop Nginx Load Balancer') {
            steps {
                script {
                    runScript('clean.sh')
                }
            }
        }
    }
}

def runScript(scriptName) {
    if (isUnix()) {
        // Linux/Mac agents
        sh "bash \"${env.WORKSPACE}/sh/${scriptName}\""
    } else {
        // Windows agents → convert to WSL path
        def wslPath = env.WORKSPACE
            .replace('\\', '/')    // Convert backslashes to forward slashes
            .replaceAll('^([A-Za-z]):', '/mnt/$1') // Convert drive letter to /mnt/c format
            .toLowerCase()
        bat "wsl bash \"${wslPath}/sh/${scriptName}\""
    }
}
