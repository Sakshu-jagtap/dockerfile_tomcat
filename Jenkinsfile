pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                sh 'git init '
                echo "Successful pull from Git"
                git 'https://github.com/Sakshu-jagtap/dockerfile_tomcat.git'
            }
        }
        stage('Build') {
            agent {
                label 'docker'
            }
            steps {
                echo "Building with Maven"
                sh 'mvn clean package'
            }
        }
    
        stage('creating tomcat image Tomcat') {
            agent {
                label 'docker'
            }
            steps {
                script {
                    sh '''cp -r /var/lib/jenkins/workspace/deploy/target/*.war .
                    docker build -t   sakshijagtap457647/tomcat .
                    docker login 
                    docker push  sakshijagtap457647/tomcat '''
                }
            }
        }
        stage('build image on k8 ') {
            agent {
                label 'docker'
            }
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
        stage('getting info') {
            agent {
                label 'docker'
            }
            steps {
                script {
                    sh '''kubectl get pods -o wide 
                    kubectl get nodes -o wide 
                    kubectl get svc -o wide 
                    ls /var/lib/jenkins/workspace/deploy/target/'''
                }
            }
        }
    }
}