docker run -d -v /opt/ca/jenkins/jenkins_home:/var/jenkins_home --env JAVA_OPTS="-Dhudson.model.DirectoryBrowserSupport.CSP="  --name=jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins 

