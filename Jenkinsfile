node {

    stage 'Checkout'
    git branch: 'main', credentialsId: 'git', url: 'https://github.com/Bouhmid30/ezlearning1.git'
    def mvnHome = tool 'M3'
    withMaven {
      sh "${mvnHome}/bin/mvn clean package -DskipTests"
      sh "${mvnHome}/bin/mvn sonar:sonar -Dsonar.projectKey=ez-learning -Dsonar.host.url=https://sonarqube-jenkins.apps.ocp4.smartek.ae -Dsonar.login=sonar"
    } //
    // Get the maven tool

    // ** NOTE: This 'M3' maven tool must be configured in the global configuration

    // def mvnHome = tool 'maven'

    

    stage 'Build'

    //sh "${mvnHome}/bin/mvn clean package -DskipTests"
    sh 'oc start-build ezlearning-1-git --from-file=./target/platform-0.0.1-SNAPSHOT.jar -n ez-learning --follow'



}
