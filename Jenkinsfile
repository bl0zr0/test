pipeline {

    agent any

    stages {
        stage('Clone') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: 'feature/app-containerisation',
                    doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
                    extensions: scm.extensions,
                    userRemoteConfigs: scm.userRemoteConfigs,
                    depth: 1
                ])
                sh 'pwd'
                sh 'ls -l'
                // git branch: 'feature/app-containerisation',
                //     credentialsId: 'f70b7a5f-0134-4784-a4ca-8c526557b94c',
                //     url: 'git@bitbucket.org:teamprezzee/prezzee-server.git'
            }
        }

        stage('Build') {
            steps{
                sh 'pwd'
                sh 'ls -l'
                // Build container image
                sh 'docker build -t prezzee-server:manual-supervisor --build-arg ENV=nonprod --target app -f docker/aws/Dockerfile.supervisor .'
            }
        }

    }
}

