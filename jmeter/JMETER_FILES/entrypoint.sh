#!/bin/sh
  
sed -i 's/APP_HOST/'"${APP_HOST}"'/g' ${TEST_HOME}/JenkinsJmeterTest.jmx
sed -i 's/APP_PORT/'"${APP_PORT}"'/g' ${TEST_HOME}/JenkinsJmeterTest.jmx

${JMETER_HOME}/bin/jmeter  -n -t ${TEST_HOME}/JenkinsJmeterTest.jmx -l ${TEST_HOME}/result.jtl
