docker run -d \
-p 8999:8080 \
--add-host=centOS7.5-aop2.dev.fco:10.238.32.21 \
-v /opt/ca/JenkinsPipelineApp/DockerApp/APP_RUNTIME/logs:/opt/ca/springbootApp/wily/logs \
--name=apm-agent \
apm-agent:latest
