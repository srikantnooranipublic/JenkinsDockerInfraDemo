#!/bin/sh
  
echo " APP HOST is ${APP_HOST}"
echo " APP PORT is ${APP_PORT}"

sed -i 's/APP_HOST/'"${APP_HOST}"'/g' ${TEST_HOME}/JenkinsJmeterTest.jmx
sed -i 's/APP_PORT/'"${APP_PORT}"'/g' ${TEST_HOME}/JenkinsJmeterTest.jmx

${JMETER_HOME}/apache-jmeter-5.0/bin/jmeter  -n -t ${TEST_HOME}/JenkinsJmeterTest.jmx -l ${TEST_HOME}/result.jtl
