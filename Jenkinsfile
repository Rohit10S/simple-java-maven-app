pipeline{
	agent any
	triggers {
  		pollSCM '* * * * *'
	}

	stages{
		stage ('git'){

			steps{
			checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rohit10S/simple-java-maven-app.git']])
			}

		} //stage one completed
		
		stage('Build'){

			steps{
			sh './mvnw package'
			
			}
		}

	}

}
