node {

    stage 'Checkout'
    git branch: 'main', credentialsId: 'git', url: 'https://github.com/Bouhmid30/ezlearning1.git'
    def mvnHome = tool 'M3'
    withMaven {
      sh "${mvnHome}/bin/mvn clean package -DskipTests"
    } //
    
    stage 'Test code sonar'
    sh "${mvnHome}/bin/mvn sonar:sonar -Dsonar.projectKey=ez -Dsonar.host.url=http://sonarqube-1.jenkins.svc.cluster.local:9000 -Dsonar.login=sqp_954f9b058cf24e19fd1625c98c22fdc34aa3d5fa"

    // Get the maven tool

    // ** NOTE: This 'M3' maven tool must be configured in the global configuration

    // def mvnHome = tool 'maven'
    
    //stage 'SonarQube analysis'
    //withSonarQubeEnv('sonarqube') { 
            //sh "${mvnHome}/bin/mvn sonar:sonar"
    //}

    

    stage 'Build'

    //sh "${mvnHome}/bin/mvn clean package -DskipTests"
    sh 'oc start-build ezlearning-1-git --from-file=./target/platform-0.0.1-SNAPSHOT.jar -n ez-learning --follow'



}
