docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
                -v $(which docker):/usr/bin/docker \
		-v /Users/noosr03/Documents/CA_Technical/2_ProjectRepo/JenkinsDockerInfra/jenkins/jenkins_home:/var/jenkins_home \
		--env JAVA_OPTS="-Dhudson.model.DirectoryBrowserSupport.CSP="  --name=jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins 

