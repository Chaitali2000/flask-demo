pipeline {
    agent any
    stages {
        stage ('SCM checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Chaitali2000/flask-demo.git'
            }
        }
        stage ('docker image build') {
           steps {
               sh '/usr/bin/docker image build -t chaitalidalal/flaskimage .'
           }
        }
        
        stage ('docker login') {
            steps {
                sh 'echo dckr_pat_xjPNZ9O3eDLH4V_ygQpN01VjO6c | /usr/bin/docker login -u chaitalidalal --password-stdin'
            }
        }
        
        stage ('docker image push') {
            steps {
                sh '/usr/bin/docker image push chaitalidalal/flaskimage'
            }
        }
        
        stage ('remove existing service') {
            steps {
                sh '/usr/bin/docker service rm flask-service'
            }
        }
        
        stage ('create docker service ') {
            steps {
                sh '/usr/bin/docker service create --name flask-service -p 4000:4000 --replicas 2 chaitalidalal/flaskimage'
            }
        }
    }
}    
