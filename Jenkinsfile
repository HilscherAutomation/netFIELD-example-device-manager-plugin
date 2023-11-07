pipeline {
  agent any
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/HilscherAutomation/netFIELD-example-device-manager-plugin', branch: 'dev')
      }
    }

    stage('') {
      steps {
        sh 'ls -la'
      }
    }

  }
}