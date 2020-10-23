#!/usr/bin/groovy
pipeline {
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
metadata:
  name: buildkitd
spec:
  containers:
  - name: buildkitd
    image: moby/buildkit:master
    readinessProbe:
      exec:
        command:
        - buildctl 
        - debug 
        - workers
      initialDelaySeconds: 5
      periodSeconds: 30
    livenessProbe:
      exec:
        command:
        - buildctl 
        - debug 
        - workers
      initialDelaySeconds: 5
      periodSeconds: 30
    securityContext:
      privileged: true
  - name: maven
    image: maven:alpine
    command:
    - cat
    tty: true
      '''
    }
  }
  stages('Maven build') {
    stage('build maven') {
      steps {
        container('maven') {
          sh '''
	          mvn -version
            mvn package
	          '''
        }
      }
      
    }
    stage('build images') {
      steps {
        container('buildkitd') {
          sh 'docker login -u trinhanhquan.it@gmail.com -p Anhquan123@'
        }
      }
    }  
  }
}
