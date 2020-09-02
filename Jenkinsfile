pipeline {

    agent any

    stages {
        stage('Clone') {
            steps {
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: 'refs/heads/feature/app-containerisation']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CheckoutOption', timeout: 30], [$class: 'CloneOption', depth: 1, honorRefspec: true, noTags: true, reference: '', shallow: true, timeout: 30]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'f70b7a5f-0134-4784-a4ca-8c526557b94c', url: 'git@bitbucket.org:teamprezzee/prezzee-server.git']]]
                sh 'pwd'
                sh 'ls -l'
                // git branch: 'feature/app-containerisation',
                //     credentialsId: 'f70b7a5f-0134-4784-a4ca-8c526557b94c',
                //     url: 'git@bitbucket.org:teamprezzee/prezzee-server.git'
            }
        }

        stage('Build') {
            steps{
                // Login to ECR
                sh 'aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 017460935128.dkr.ecr.ap-southeast-2.amazonaws.com'
                // Build container image
                sh 'DOCKER_BUILDKIT=1 docker build -t prezzee-server:manual-supervisor --build-arg ENV=nonprod --target app -f docker/aws/Dockerfile.supervisor .'
                sh 'docker tag prezzee-server:manual-supervisor 017460935128.dkr.ecr.ap-southeast-2.amazonaws.com/prezzee-test/prezzee-server:manual-supervisor'
                sh 'docker push 017460935128.dkr.ecr.ap-southeast-2.amazonaws.com/prezzee-test/prezzee-server:manual-supervisor'
            }
        }

    }
}

