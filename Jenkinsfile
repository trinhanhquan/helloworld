pipeline {
  agent {
    kubernetes {
      yaml 'pod.yaml'
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
