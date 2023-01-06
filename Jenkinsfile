pipeline{
	agent any
	triggers {
  		pollSCM '* * * * *'
	}

	stages{
		
		stage ('Cloning Git'){

			steps{
			checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rohit10S/simple-java-maven-app.git']])
			}

		} 
		
		#Building Docker image and Tagging
		stage('Docker Build and Tag'){
			
			steps{
			sh 'docker build --no-cache -t ihtor/mvnsimple:${BUILD_NUMBER} .'
			}
		}
		
		# Logging into Docker hub using docker pipeline jenkins plugin and pushing image to docker hub
		stage('Publish image to Docker Hub') {
			steps {
			withDockerRegistry(credentialsId: 'dockertoken', url: '') {
			sh  'docker push ihtor/mvnsimple:${BUILD_NUMBER}'
			}
				
				
			
			}
		}
		
		
		# Logging into Private instance using sshagent jenkins plugin
		stage('Login to private instance'){
			steps{
			sshagent(['sshtoken']) {
          		sh 'ssh -o StrictHostKeyChecking=no ec2-user@172.20.20.109'
			sh 'docker run ihtor/mvnsimple:${BUILD_NUMBER}'
			}
			
			}
		}
		
		
		
		

	}

}
