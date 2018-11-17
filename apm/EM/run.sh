docker run -d \
-p 5011:5001 \
-p 8091:8081 \
-p 8454:8444 \
--add-host=centOS7.5-aop.dev.fco:10.238.238.47 \
-v /opt/ca/apm/EM/EM_RUNTIME/logs:/opt/CA/Introscope/logs \
-v /opt/ca/apm/EM/EM_RUNTIME/traces:/opt/CA/Introscope/traces \
-v /opt/ca/apm/EM/EM_RUNTIME/data:/opt/CA/Introscope/data \
-v /opt/ca/apm/EM/EM_RUNTIME/config:/opt/CA/Introscope/config \
--name=apm-em \
apm-em:latest

