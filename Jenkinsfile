node {

    stage 'Checkout'
    git branch: 'main', credentialsId: 'git', url: 'https://github.com/Bouhmid30/ezlearning1.git'
    def mvnHome = tool 'M3'
    withMaven {
      sh "${mvnHome}/bin/mvn clean package -DskipTests"
      sh "${mvnHome}/bin/mvn sonar:sonar -Dsonar.projectKey=ez -Dsonar.host.url=https://sonarqube-jenkins.apps.ocp4.smartek.ae -Dsonar.login=3801bb5f4de2299af92a8129ac33891c2105b34a"
    } //
    // Get the maven tool

    // ** NOTE: This 'M3' maven tool must be configured in the global configuration

    // def mvnHome = tool 'maven'

    

    stage 'Build'

    //sh "${mvnHome}/bin/mvn clean package -DskipTests"
    sh 'oc start-build ezlearning-1-git --from-file=./target/platform-0.0.1-SNAPSHOT.jar -n ez-learning --follow'



}
