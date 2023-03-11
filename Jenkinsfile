pipeline {
    // The “agent” section configures on which nodes the pipeline can be run.
    // Specifying “agent any” means that Jenkins will run the job on any of the
    // available nodes.
	agent any

    stages {
        stage('Git Pull') {
            steps {
                // Get code from a GitHub repository
                // Make sure to add your own git url and credentialsId
				git url: 'https://github.com/VigneshBondugula/SPE_MiniProject.git'
		    }
        }
        stage('Maven Build') {
            steps {
                // Maven build, 'sh' specifies it is a shell command
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Images') {
             steps {
                 sh 'docker build -t vigneshbondugula/miniproj:latest .'
             }
        }
        stage('Publish Docker Images') {
            steps {
                withDockerRegistry([ credentialsId: "DockerJenkins", url: "" ]) {
                    sh 'docker push vigneshbondugula/miniproj:latest'
                }
            }
        }
        stage('Clean Docker Images') {
            steps {
               sh 'docker rmi -f vigneshbondugula/miniproj:latest'
            }
        }
    }
      post {
            always {
                sh 'docker logout'
            }
        }
}