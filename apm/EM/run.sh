cp -f EM_FILES/tess-db-cfg.xml EM_RUNTIME/config/tess-db-cfg.xml 

docker run -d \
-p 5001:5001 \
-p 8091:8081 \
-p 8454:8444 \
--add-host=centOS7.5-aop.dev.fco:10.238.238.47 \
-v /Users/noosr03/Documents/CA_Technical/3_SWAT_Projects/Jenkins/DevOpsJenkinsPipeline/apm/EM/EM_RUNTIME/logs:/opt/CA/Introscope/logs \
-v /Users/noosr03/Documents/CA_Technical/3_SWAT_Projects/Jenkins/DevOpsJenkinsPipeline/apm/EM/EM_RUNTIME/data:/opt/CA/Introscope/data \
-v /Users/noosr03/Documents/CA_Technical/3_SWAT_Projects/Jenkins/DevOpsJenkinsPipeline/apm/EM/EM_RUNTIME/config:/opt/CA/Introscope/config \
--name=apm-em \
apm-em:latest 

