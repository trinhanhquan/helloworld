#!/usr/bin/groovy
pipeline {
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  labels:
    some-label: some-label-value
  namespace: jenkins
spec:
  containers:
  - name: maven
    image: maven:alpine
    command:
    - cat
    tty: true
  - name: busybox
    image: busybox
    command:
    - cat
    tty: true
    '''
    }
  }
  stages {
    stage('build maven') {
      steps {
        container('maven') {
          sh '''
	          mvn -version
            mvn package
	          '''
        }
        container('busybox') {
          sh '/bin/busybox'
        }
      }
    }
  }
}
