pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
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
"""
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
