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
    image: moby/buildkit:custom-trinhq-v1.0
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
          sh 'docker login -u trinhanhquan -p Anhquan123@'
          sh '''
          ls -tlra
          buildctl build \
          --frontend=dockerfile.v0 \
          --local context=. \
          --local dockerfile=. \
          --output type=image,name=docker.io/trinhanhquan/cicd-helloworld:v1.0,push=true
          '''
        }
      }
    }  
  }
}
