#!/bin/sh

java -javaagent:/opt/ca/springbootApp/wily/Agent.jar -Dcom.wily.introscope.agentProfile=/opt/ca/springbootApp/wily/core/config/IntroscopeAgent.profile -Dintroscope.agent.defaultProcessName=SpringbootProcess -Dintroscope.agent.agentName=InventoryTrackingService  -jar /opt/ca/springbootApp/InventoryTrackingService-0.0.1-SNAPSHOT.jar 
