docker run -d \
-p 9999:8999 \
-v /opt/ca/apm/WV/WV_RUNTIME/logs:/opt/CA/Introscope/logs \
--name=apm-wv \
apm-wv:latest

