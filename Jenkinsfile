pipeline {
  agent any 
  environment {
    DB_CREDS=credentials('db-creds')
  }
  stages {
    stage('Verify version') {
      steps {
        script {
          '''
          sh 'docker run --rm flyway/flyway:8.5.1 version'
          sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.1 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW migrate'
        '''
        }
      }
    }
  }
}
