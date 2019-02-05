pipeline {
   agent any
	Stages {
	stage('Build') {
		steps {
			echo 'Running build automation'
			sh './dradlew build –no-daemon'
			archieveArtifacts artifacts: 'dist/trainSchedule.zip'
			}
		}
	stage('Build Docker Image') {
		when {
			branch 'master'
			}
		steps {
			script {
				app * docker.build(“Dockerhub_ID/node-app”)
				app.inside {
				sh 'echi $(curl localhost:8080)'
				}
			}
		}
	}
	stage('Push Docker Image') {
		when {
			branch 'master'
			}
		steps {
			script {
				docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') 
				app.push(“${env.BUILD_NUMBER}”)
				app.push(“latest”)
					}
		}
	}
     }
}
