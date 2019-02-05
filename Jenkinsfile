pipeline {
   agent any
	stages {
	stage('Build') {
		steps {
			echo 'Running build automation'
			sh './gradlew build –-no-daemon'
			archiveArtifacts artifacts: 'dist/trainSchedule.zip'
			}
		}
	stage('Build Docker Image') {
		when {
			branch 'master'
			}
		steps {
			script {
				app = docker.build("Dockerhub_ID/node-app")
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
				docker.withRegistry('https://registry.hub.docker.com', 'Dockerhub_ID') {
				app.push("${env.BUILD_NUMBER}")
				app.push("latest")
					}
		}
		}
	}
     }
}
