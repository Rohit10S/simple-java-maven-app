pipeline{
	agent any
	triggers {
  		pollSCM '* * * * *'
	}
	environment {
	dockerhub=credentials('dockertoken')
	}

	stages{
		stage ('Dockerfile'){

			steps{
			checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rohit10S/simple-java-maven-app.git']])
			}

		} //stage one completed
		
		
		stage('Docker Build and Tag'){
			
			steps{
			sh 'docker build --no-cache -t ihtor/mvnsimple:${BUILD_NUMBER} .'
			}
		}
		
		stage('Publish image to Docker Hub') {
			steps {
			sh 'echo $dockertoken_PASSWORD | docker login -u $dockertoken_USERNAME --password-stdin'
			sh  'docker push ihtor/mvnsimple:${BUILD_NUMBER}'
				
				
				
			
			}
		}
		
		stage('Login to private instance'){
			steps{
			sh 'ssh -i /tmp/terrakey.pem 172.20.20.109'
			sh 'docker run ihtor/mvnsimple:${BUILD_NUMBER}'	
			
			}
		}
		
		
		
		

	}

}
