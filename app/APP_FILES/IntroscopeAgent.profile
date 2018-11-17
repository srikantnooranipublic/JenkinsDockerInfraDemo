########################################################################
#                                                                      
# Introscope AutoProbe and Agent Configuration                         
#                                                                      
# CA Wily Introscope(R) Version 10.7.0 Release 10.7.0.136
# Copyright (c) 2018 CA. All Rights Reserved.
# Introscope(R) is a registered trademark of CA.
########################################################################

########################
# AutoProbe Properties #
########################

#######################
# On/Off Switch
#
# ================
# This boolean property gives you the ability to disable
# Introscope AutoProbe by settings the property value
# to false.
# You must restart the managed application before changes to this property take effect.

introscope.autoprobe.enable=true


#######################
# Custom Log File Location
#
# ================
# Introscope AutoProbe will always attempt to log the changes
# it makes.  Set this property to move the location of the
# log file to something other than the default.  Non-absolute
# names are resolved relative to the location of this
# properties file.
# You must restart the managed application before changes to this property take effect.

introscope.autoprobe.logfile=../../logs/AutoProbe.log


#######################
# Directives Files
#
# ================
# This property specifies all the directives files that determine
# how Introscope AutoProbe performs the instrumentation.  Specify
# a single entry, or a comma-delimited list of entries. The list 
# may include any combination of:
#    - directives (.pbd) files
#    - directives list (.pbl) files 
#    - directories that will be scanned about once per minute for  
#      .pbd files. Directives files placed in a listed directory
#      will be loaded automatically, without any need to edit this 
#      Agent profile. If dynamic instrumentation is enabled, the 
#      directives will take effect immediately without an app reboot.    
# Non-absolute names will be resolved relative to the location of 
# this properties file.
# IMPORTANT NOTE: This is a required parameter and it MUST be set
# to a valid value.  
#    - If the property is not specified or the values are invalid, 
#      the Introscope Agent will not run!  
#    - If the property is set to include a directory, and invalid 
#      directives files are placed in the directory, AutoProbe  
#      metrics will no longer be reported!
#    - If the property is set to include a directory, and loaded 
#      directives files are removed from the directory, AutoProbe  
#      metrics will no longer be reported!
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.

introscope.autoprobe.directivesFile=tomcat-typical.pbl,hotdeploy,spring-boot.pbd


#######################
# Agent Properties    #
#######################


#################################
# Logging Configuration
#
# ================
# Changes to this property take effect immediately and do not require the managed application to be restarted.
# This property controls both the logging level and the output location.
# To increase the logging level, set the property to:
# log4j.logger.IntroscopeAgent=VERBOSE#com.wily.util.feedback.Log4JSeverityLevel, console, logfile
# To send output to the console only, set the property to:
# log4j.logger.IntroscopeAgent=INFO, console
# To send output to the logfile only, set the property to:
# log4j.logger.IntroscopeAgent=INFO, logfile

log4j.logger.IntroscopeAgent=DEBUG, logfile
 
# If "logfile" is specified in "log4j.logger.IntroscopeAgent",
# the location of the log file is configured using the
# "log4j.appender.logfile.File" property.
# System properties (Java command line -D options)
# are expanded as part of the file name.  For example,
# if Java is started with "-Dmy.property=Server1", then
# "log4j.appender.logfile.File=../../logs/Introscope-${my.property}.log"
# is expanded to:
# "log4j.appender.logfile.File=../../logs/Introscope-Server1.log".

log4j.appender.logfile.File=../../logs/IntroscopeAgent.log
 
########## See Warning below ##########
# Warning: The following properties should not be modified for normal use.
# You must restart the managed application before changes to this property take effect.
log4j.additivity.IntroscopeAgent=false
log4j.appender.console=com.wily.org.apache.log4j.ConsoleAppender
log4j.appender.console.layout=com.wily.org.apache.log4j.PatternLayout
log4j.appender.console.layout.ConversionPattern=%d{M/dd/yy hh:mm:ss a z} [%-3p] [%c] %m%n
log4j.appender.console.target=System.err
log4j.appender.logfile=com.wily.introscope.agent.AutoNamingRollingFileAppender
log4j.appender.logfile.layout=com.wily.org.apache.log4j.PatternLayout
log4j.appender.logfile.layout.ConversionPattern=%d{M/dd/yy hh:mm:ss a z} [%-3p] [%c] %m%n
log4j.appender.logfile.MaxBackupIndex=4
log4j.appender.logfile.MaxFileSize=2MB
#########################################

#################################
# DNS lookup configuration
# 
# Agent has following DNS lookup implementations: direct and separateThread.  Implementation to use is specified 
# by value of introscope.agent.dns.lookup.type property.
# direct performs DNS lookups in application thread. Application thread will be delayed by length of time the 
# underlying DNS mechanism takes to perform a specific lookup.
# separateThread performs DNS lookups in a separate thread. The application thread is delayed at most by 
# introscope.agent.dns.lookup.max.wait.in.milliseconds milliseconds.
# When using separateThread implementation, if lookup of host name by IP address times out, IP address will be returned
# in place of name and if lookup of IP address by host name times out, empty IP address will be returned.  
# Default DNS lookup implementation is separateThread
#
# You must restart the managed application before change to this property takes effect.
#introscope.agent.dns.lookup.type=direct
introscope.agent.dns.lookup.type=separateThread
#
# Maximum time in milliseconds separateThread implementation waits to lookup a host name or IP address. 
# It is ignored by direct implementation.  Default value is 200.
# Change to this property takes effect immediately and does not require the managed application to be restarted.
introscope.agent.dns.lookup.max.wait.in.milliseconds=200


#################################
# Enterprise Manager Locations and Names 
#
# The Enterprise Manager 'connection order' list the Agent uses if it 
# is disconnected from its Enterprise Manager is determined automatically
# based on the numeric suffix provided to "agentManager.url" property.
#
# For example if "agentManager.url.1" , "agentManager.url.2" and 
# "agentManager.url.3" are defined and enabled then connection order 
# will be "1,2,3" with "1" getting the highest precedence and so on.
#
# Default channel is "1". All the related properties of default channel 
# are suffixed with "1".
# Similarly if channel "2" is defined and enabled , then all of the
# properties related to it must be suffixed with "2".
#
# ================
# Settings the Introscope Agent uses to find the Enterprise Manager 
# and names given to host and port combinations.
#
# You must restart the managed application before changes to this property take effect.

agentManager.url.1=10.238.32.21:5001

# The following connection properties enable the Agent to tunnel communication 
# to the Enterprise Manager over HTTP.
#
# WARNING: This type of connection will impact Agent and Enterprise Manager 
# performance so it should only be used if a direct socket connection to the 
# the Enterprise Manager is not feasible. This may be the case if the Agent 
# is isolated from the Enterprise Manager with a firewall blocking all but 
# HTTP traffic.
# 
# When enabling the HTTP tunneling Agent, uncomment the following host and port
# properties, setting the host name and port for the Enterprise Manager Web Server. 
# Comment out any other connection properties assigned to the default channel "1"
# (i.e. properties having "1" as suffix)
#
# "http" in the value of the below property states the agent to use HTTP tunneling
# for connecting to EM.
#
# You must restart the managed application before changes to this property take effect.
#agentManager.url.1=http://localhost:8081


# The following properties are used only when the Agent is tunneling over HTTP 
# and the Agent must connect to the Enterprise Manager through a proxy server 
# (forward proxy). Uncomment and set the appropriate proxy host and port values. 
# If the proxy server cannot be reached at the specified host and port, the 
# Agent will try a direct HTTP tunneled connection to the Enterprise Manager 
# before failing the connection attempt.
# You must restart the managed application before changes to this property take effect.
#agentManager.httpProxy.host=
#agentManager.httpProxy.port=

# The following properties are used only when the proxy server requires 
# authentication. Uncomment and set the user name and password properties.
# You must restart the managed application before changes to this property take effect.
# For NTLM credentials you must separate domain name from user name by escaped backslash
# e.g. mydomain.com\\jack01
#agentManager.httpProxy.username=
#agentManager.httpProxy.password=

# To connect to the Enterprise Manager using HTTPS (HTTP over SSL),
# uncomment the below property and set the host and port to the EM's secure https listener host and port.
# "https" in the value of the below property states the agent to use HTTPS tunneling for connecting to EM.
#agentManager.url.1=https://localhost:8444

# To connect to the Enterprise Manager using SSL,
# uncomment the below property and set the host and port to the EM's SSL server socket host and port.
# "ssl" in the value of the below property states the agent to use SSL socket for connecting to EM.
#agentManager.url.1=ssl://localhost:5443


# Additional properties for connecting to the Enterprise Manager using SSL.
#
# Location of a truststore containing trusted EM certificates.
# If no truststore is specified, the agent trusts all certificates.
# Either an absolute path or a path relative to the agent's working directory.
# On Windows, backslashes must be escaped.  For example: C:\\keystore
#agentManager.trustStore.1=
# The password for the truststore
#agentManager.trustStorePassword.1=
# Location of a keystore containing the agent's certificate.
# A keystore is needed if the EM requires client authentication.
# Either an absolute path or a path relative to the agent's working directory.
# On Windows, backslashes must be escaped.  For example: C:\\keystore
#agentManager.keyStore.1=
# The password for the keystore
#agentManager.keyStorePassword.1=
# Set the enabled cipher suites.
# A comma-separated list of cipher suites.
# If not specified, use the default enabled cipher suites.
#agentManager.cipherSuites.1=


#################################
# Enterprise Manager Failback Retry Interval
#
# ================
# When the Agent is configured to have multiple Enterprise Managers
# in its connection order and this property is enabled, the Introscope 
# Agent will automatically attempt to connect to the Enterprise Manager
# in its connection order to which it can connect in allowed mode.
# In case no such Enterprise Manager is found, the reconnection attempt 
# will occur on a regular interval as specified.
# Agent will not connect to any Enterprise Manager in disallowed mode,  
# when this property is enabled.
# You must restart the managed application before changes to this property take effect.

#introscope.agent.enterprisemanager.failbackRetryIntervalInSeconds=120


#######################
# Custom Process Name
#
# ================
# Specify the process name as it should appear in the Introscope Enterprise Manager and Workstation.
# : and | characters are reserved and hence considered Illegal characters in process name.
# Using \ in process name need to be escaped with \\.
# You must restart the managed application before changes to this property take effect.

introscope.agent.customProcessName=Tomcat


#######################
# Default Process Name
#
# ================
# If no custom process name is provided and the
# agent is unable to determine the name of the
# main application class, this value will be
# used for the process name.
# You must restart the managed application before changes to this property take effect.

introscope.agent.defaultProcessName=UnknownProcess


#######################
# Agent Name
#
# ================
# Specify the name of this agent as it appears in the
# Introscope Enterprise Manager and Workstation.

# Use this property if you want to specify the Agent
# Name using the value of a Java System Property.
# You must restart the managed application before changes to this property take effect.
introscope.agent.agentNameSystemPropertyKey=

# This enables/disables auto naming of the agent using
# an Application Server custom service.
# You must restart the managed application before changes to this property take effect.
introscope.agent.agentAutoNamingEnabled=false

# The amount of time to delay connecting to the Introscope Enterprise
# Manager while Agent Auto Naming is attempted.
# You must restart the managed application before changes to this property take effect.
introscope.agent.agentAutoNamingMaximumConnectionDelayInSeconds=120

# When Agent Auto Naming is enabled, the Agent will check for 
# a new Application Server determined name on the specified interval.
# You must restart the managed application before changes to this property take effect.
introscope.agent.agentAutoRenamingIntervalInMinutes=10

# Auto name of log files (Agent, AutoProbe and LeakHunter) with
# the Agent name or a timestamp can be disabled by setting the 
# value of this property to 'true'.  Log file auto naming only 
# takes effect when the Agent name can be determined using a 
# Java System Property or an Application Server custom service.
# You must restart the managed application before changes to this property take effect.
introscope.agent.disableLogFileAutoNaming=false

# This Agent Name is used if the other methods are disabled or fail.
# You must restart the managed application before changes to this property take effect.
introscope.agent.agentName=Tomcat Agent

# Fully Qualified Domain Name (FQDN) can be enabled by setting this property  
# value to 'true'. By Default (false) it will display HostName.
# Set to 'true' when integrating with Catalyst.
# You must restart the managed application before changes to this property take effect.
introscope.agent.display.hostName.as.fqdn=false


#######################
# Agent Socket Rate Metrics
#
# ================
# Set to true to enable the reporting of input and
# output bandwidth rate metrics for individual sockets.   NOTE: this parameter is only
# used if PDB flag ManagedSocketTracing is 'on'.
# You must restart the managed application before changes to this property take effect.
introscope.agent.sockets.reportRateMetrics=false

############################### 
#Agent Memory Overhead Setting 
# 
# ======================= 
# Set to true if you want to attempt to reduce the agent memory overhead introduced by architectural improvements to the 8.x Agent.
# Increased Agent memory overhead only occurs in certain extreme cases.
# The trade-off for the possible lower memory consumption is a possible increase in response time.  
# Each application is unique and will experience different variations in Memory vs. Response Time trade-offs.
# This property is set to false by default and out of the box is commented out. This is not a hot property 
# and the managed application needs to be restarted for this flag to take effect. 
     
#introscope.agent.reduceAgentMemoryOverhead=true 

#######################
# Agent I/O Socket Metrics
# Generation of I/O Socket metrics may be restricted by the following parameters.
# Each parameter consists of a comma-separate list of values.  If any individual value is
# invalid, it will be ignored.  If any parameter is not defined, or after exclusion of any
# invalid values is an empty list, no restriction will apply to that parameter.  All 
# parameters are 'hot', i.e. no restart of the managed application is required before the
# changed value is used.
#
# Restrict socket client connections instrumented to those with specified remote hosts
introscope.agent.io.socket.client.hosts=
# Restrict socket client connections instrumented to those with specified remote ports
introscope.agent.io.socket.client.ports=
# Restrict socket client connections instrumented to those using specified local ports.
introscope.agent.io.socket.server.ports=


#######################
# Agent NIO Metrics
# Generation of Datagram and Socket metrics may be restricted by the following parameters.
# Each parameter consists of a comma-separate list of values.  If any individual value is
# invalid, it will be ignored.  If any parameter is not defined, or after exclusion of any
# invalid values is an empty list, no restriction will apply to that parameter.  All 
# parameters are 'hot', i.e. no restart of the managed application is required before the
# changed value is used.
#
# Restrict datagram client connections instrumented to those with specified remote hosts
introscope.agent.nio.datagram.client.hosts=
# Restrict datagram client connections instrumented to those with specified remote ports
introscope.agent.nio.datagram.client.ports=
# Restrict datagram client connections instrumented to those using specified local ports.
introscope.agent.nio.datagram.server.ports=
# Restrict socket client connections instrumented to those with specified remote hosts
introscope.agent.nio.socket.client.hosts=
# Restrict socket client connections instrumented to those with specified remote ports
introscope.agent.nio.socket.client.ports=
# Restrict socket client connections instrumented to those using specified local ports.
introscope.agent.nio.socket.server.ports=


#######################
# Agent Extensions Directory
#
# ================
# This property specifies the location of core extensions to be loaded
# by the Introscope Agent.  Non-absolute names are resolved relative 
# to the location of this properties file.
# You must restart the managed application before changes to this property take effect.

introscope.agent.extensions.directory=../ext

# This property specifies the location of extension bundles
# to be loaded by the Introscope Agent from the extensions 
# directory. You must restart the managed application before
# changes to this property take effect.

introscope.agent.extensions.bundles.directory=../../extensions

# Extensions deployment has three modes: controlled, dynamic, and off.
# In dynamic mode extensions can be added/removed from the agent's
# extensions/deploy directory without requiring an agent restart.
#
# In controlled mode, adding or removing extensions requires 
# an agent restart and the agent will only load extensions 
# from the extensions/deploy directory during the agent startup.
#
# In off mode, extensions deployment is disabled and no extensions
# will be loaded from the extensions\deploy directory of the agent.

# You must restart the managed application before
# changes to this property take effect.

introscope.agent.extensions.bundles.mode=dynamic

# Some extensions require classes to be pre-loaded at startup in order to avoid deadlocks
# during instrumentation. This property controls the behavior of eager class loading of
# these extensions. Only modify this setting, when having trouble with agent class loading
# or deadlocks.
# Possible values are: disabled, enabled, cached.
# Default value is enabled.
# You must restart the managed application before changes to this property take effect.

#introscope.agent.extensions.eagerloader=cached

#######################
# Agent Common Directory
#
# ================
# This property specifies the location of common directory to be loaded
# by the Introscope Agent.  Non-absolute names are resolved relative 
# to the location of this properties file.
# You must restart the managed application before changes to this property take effect.

introscope.agent.common.directory=../../common


#######################
# Agent Thread Priority
#
# ================
# Controls the priority of agent threads.  Varies
# from 1 (low) to 10 (high). Default value if unspecified is Thread.NORM_PRIORITY (5)
# You must restart the managed application before changes to this property take effect.

#introscope.agent.thread.all.priority=5


#######################
# Cloned Agent Configuration
#
# ================
# Set to true when running identical copies of an application on the same machine.
# You must restart the managed application before changes to this property take effect.

introscope.agent.clonedAgent=false


#######################
# Platform Monitor Configuration
#
# ================
# Use this property to override the Agent's default Platform Monitor
# detection. To override the default, uncomment the relevant
# definition of introscope.agent.platform.monitor.system from those
# shown below.
# 32-Bit platform monitor binaries can work only on 32-bit JVMs and
# 64-Bit platform monitor binaries can work only on 64-bit JVMs.
# You must restart the managed application before changes to this property take effect.

#introscope.agent.platform.monitor.system=SolarisAmd32
#introscope.agent.platform.monitor.system=SolarisAmd64
#introscope.agent.platform.monitor.system=SolarisSparc32
#introscope.agent.platform.monitor.system=SolarisSparc64
#introscope.agent.platform.monitor.system=AIXPSeries32
#introscope.agent.platform.monitor.system=AIXPSeries64
#introscope.agent.platform.monitor.system=WindowsIntelAmd32
#introscope.agent.platform.monitor.system=WindowsIntelAmd64
#introscope.agent.platform.monitor.system=LinuxIntelAmd32
#introscope.agent.platform.monitor.system=LinuxIntelAmd64 


####################### 
# JMX Configuration  
# 
# ================ 
# Controls collection of data from JMX MBeans; 
# set to true to gather JMX data in the Introscope Agent. 
# You must restart the managed application before changes to this property take effect.
    
introscope.agent.jmx.enable=false 
    
# JMX metrics polling interval;
# Set to true to change the polling interval to 15 seconds; default is false (7.5 seconds)

#introscope.agent.jmx.maxpollingduration.enable=true

# Controls collection of rate counter metrics for JMX MBeans data;
# Set to true to gather JMX rate counter metrics in the Introscope Agent; default is false.
# You must restart the managed application before changes to this property take effect.

#introscope.agent.jmx.ratecounter.enable=true

# Used to account for a counter reset for JMX rate counter metrics.  
# Will report the old counter rate if the rate is negative; default is false.

#introscope.agent.jmx.ratecounter.reset.enable=true

# Controls collection of data (CompositeData type) from JMX MBeans;
# Set to true to gather JMX data in the Introscope Agent; default is false.
# You must restart the managed application before changes to this property take effect.

#introscope.agent.jmx.compositedata.enable=true

# Configure primary name keys to use for conversion of  
# MBean names into Introscope metric names; 
# A comma-separated, ordered list of keys which 
# should uniquely identify a particular MBean. 
  
# You must restart the managed application before changes to this property take effect.
#introscope.agent.jmx.name.primarykeys= 
  
# Controls which JMX data is gathered - a comma-separated
# list of desired keywords  If the Introscope metric name contains 
# one of them, the metric will be polled by the Introscope Agent.
# Leave empty to include all MBean data available in the system.
# The default settings are not exhaustive. Add additional metrics from other MBeans as required.
# * and ? wildcard characters are supported and can be escaped with \\.
# You must restart the managed application before changes to this property take effect.

introscope.agent.jmx.name.filter=Catalina|*type=Cache:*Count,Catalina|J2EEApplication=*:*Count,Catalina|*type=ThreadPool:currentThreadsBusy,Catalina|*|type=ThreadPool:*Count,java.lang|type=Threading:*ThreadCount,java.lang|type=ClassLoading*:*ClassCount,java.nio|*|type=BufferPool:MemoryUsed,java.lang*type=GarbageCollector:CollectionTime
  
# Controls which (if any) JMX MBean attributes are to be ignored. 
# A comma-separated list of desired keywords. If an MBean attribute 
# name matches one in this list then it will be ignored. 
# Leave empty to include all MBean attributes. 
# You must restart the managed application before changes to this property take effect.
  
#introscope.agent.jmx.ignore.attributes=server 
  
# Controls whether or not to include string-valued metrics. 
# Excluding string-valued metrics reduces the overall metric 
# count, improving agent and EM performance.  To enable 
# string-valued metrics, set this property value to false. 
# You must restart the managed application before changes to this property take effect.
introscope.agent.jmx.excludeStringMetrics=true 




#######################
# LeakHunter Configuration
#
# ================
# Configuration settings for Introscope LeakHunter

# Controls whether the feature is enabled if the LeakHunter Add-on is present.
# Set the value to true to enable LeakHunter.
# You must restart the managed application before changes to this property take effect.

introscope.agent.leakhunter.enable=true

# Controls the location for the LeakHunter log file.
# Relative filenames are relative to the application working directory.
# Leave the value blank if you do not want LeakHunter to record data
# to a log file.
# You must restart the managed application before changes to this property take effect.

introscope.agent.leakhunter.logfile.location=../../logs/LeakHunter.log

# Controls whether LeakHunter will append or overwrite the log file.
# Set the value to true to append to the log file.
# You must restart the managed application before changes to this property take effect.

introscope.agent.leakhunter.logfile.append=false

# Controls the sensitivity of the leak detection algorithm.
# The value should be an integer from 1-10.  A higher
# sensitivity setting will result in more potential leaks
# reported and a lower sensitivity will result in fewer
# potential leaks reported.
# You must restart the managed application before changes to this property take effect.

introscope.agent.leakhunter.leakSensitivity=8

# Controls the length of time LeakHunter spends looking for new
# potential leaks.  After the timeout, LeakHunter will stop looking
# for new potential leaks and just continue tracking the previously
# identified potential leaks.  Set the value to zero if you want
# LeakHunter to always look for new potential leaks.
# You must restart the managed application before changes to this property take effect.

introscope.agent.leakhunter.timeoutInMinutes=240

# Controls whether LeakHunter generates allocation stack traces for
# potential leaks.  Turning this on gives you more precise data about
# the potential leak's allocation, but requires additional memory and
# CPU overhead.  For this reason, the default setting is false.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.leakhunter.collectAllocationStackTraces=true

# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.leakhunter.ignore.0=org.apache.taglibs.standard.lang.jstl.*
introscope.agent.leakhunter.ignore.1=net.sf.hibernate.collection.*
introscope.agent.leakhunter.ignore.2=org.jnp.interfaces.FastNamingProperties
introscope.agent.leakhunter.ignore.3=java.util.SubList
introscope.agent.leakhunter.ignore.4=com.sun.faces.context.BaseContextMap$EntrySet
introscope.agent.leakhunter.ignore.5=com.sun.faces.context.BaseContextMap$KeySet
introscope.agent.leakhunter.ignore.6=com.sun.faces.context.SessionMap
introscope.agent.leakhunter.ignore.7=java.util.Collections$UnmodifiableMap
introscope.agent.leakhunter.ignore.8=org.hibernate.collection.PersistentSet



#######################
# SQL Agent Configuration
#
# You must restart the managed application before changes to these properties take effect.
# Configuration settings for Introscope SQL Agent
# ================

# Turns off metrics for individual SQL statements. The default value is false.
#introscope.agent.sqlagent.sql.turnoffmetrics=false

# Report only Average Response Time metric for individual SQL statements. The default value is false.
#introscope.agent.sqlagent.sql.artonly=false

# Turn off transaction tracing for individual sql statements. The default value is false.
#introscope.agent.sqlagent.sql.turnofftrace=false

#This property specifies the number of unique normalized SQL statement metrics that the 
#SQL agent can report. Once the clamp is hit, the SQL agent reports all additional normalized
#SQL statement metrics under the SQL | Default metric node in the Metric Browser tree. 
# Changes to this property take effect immediately and do not 
# require managed application restart
introscope.agent.sqlagent.statement.clamp=100

######################################
# SQL Agent Normalizer extension
#
# ================
# Configuration settings for SQL Agent normalizer extension


# Specifies the name of the sql normalizer extension that will be used 
# to override the preconfigured normalization scheme. To make custom 
# normalization extension work, the value of its manifest attribute 
# com-wily-Extension-Plugin-{pluginName}-Name should match with the 
# value given to this property. If you specify a comma separated list 
# of names, only the first name will be used. Example, 
# introscope.agent.sqlagent.normalizer.extension=ext1, ext2
# Only ext1 will be used for normalization. By default we now ship the  
# RegexSqlNormalizer extension
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
#introscope.agent.sqlagent.normalizer.extension=RegexSqlNormalizer

##############################
# RegexSqlNormalizer extension
#
# ==================
# The following properties pertain to RegexSqlNormalizer which 
# uses regex patterns and replace formats to normalize the sql in 
# a user defined way. 


# This property if set to true will make sql strings to be
# evaluated against all the regex key groups. The implementation
# is chained. Hence, if the sql matches multiple key groups, the
# normalized sql output from group1 is fed as input to group2 and 
# so on. If the property is set to 'false', as soon as a key group  
# matches, the normalized sql output from that group is returned
# Changes to this property take effect immediately and do not require 
# the managed application to be restarted.
# Default value is 'false'
#introscope.agent.sqlagent.normalizer.regex.matchFallThrough=true

# This property specifies the regex group keys. They are evaluated in order
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
#introscope.agent.sqlagent.normalizer.regex.keys=key1

# This property specifies the regex pattern that will be used
# to match against the sql. All valid regex alowed by java.util.Regex
# package can be used here.
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
# eg: (\\b[0-9,.]+\\b) will filter all number values, ('.*?') will filter
# anything between single quotes, ((?i)\\bTRUE\\b|\\bFALSE\\b) will filter
# boolean values from the query.
#introscope.agent.sqlagent.normalizer.regex.key1.pattern=(".*?")|('.*?')|(\\b[0-9,.]+\\b)|((?i)\\bTRUE\\b|\\bFALSE\\b)

# This property if set to 'false' will replace the first occurrence of the
# matching pattern in the sql with the replacement string. If set to 'true'
# it will replace all occurrences of the matching pattern in the sql with
# replacement string
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
# Default value is 'false'
#introscope.agent.sqlagent.normalizer.regex.key1.replaceAll=true

# This property specifies the replacement string format. All valid 
# regex allowed by java.util.Regex package java.util.regex.Matcher class
# can be used here.
# eg: The default normalizer replaces the values with a question mark (?)
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
#introscope.agent.sqlagent.normalizer.regex.key1.replaceFormat=?

# This property specifies whether the pattern match is sensitive to case
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
#introscope.agent.sqlagent.normalizer.regex.key1.caseSensitive=false

###########################################
#
# SQL Parameter Tracing
#
# Trace Caution: enabling the properties in below section may result in passwords and sensitive
# information to be presented in Transaction Trace. 
# Changing these properties requires restarting the Monitored Process

# Unnormalized sql will appear as parameter for database backend components in transaction trace
#
#introscope.agent.sqlagent.sql.rawsql=true

# Must set this to true to enable SQL parameter tracing
#introscope.agent.sqlagent.showparams=true

# maximum size of SQL statement traced
introscope.agent.sqlagent.sql.maxlength=500

# maximum size of SQL parameter traced
introscope.agent.sqlagent.maxparamlength=100

# add SQL statement with bound parameters resolved instead of place holders to transaction trace
#introscope.agent.sqlagent.resolveBindParams=true

# Maximum number of prepared statements that are being tracked for bind variables
introscope.agent.sqlagent.statements.max=1000

# In addition to SQL bind parameters, show connection URL in transaction trace
# It is also important to turn on connection URL caching flag below to avoid potential agent instability.
#introscope.agent.sqlagent.showurl=true

# Allow prepared statement connection url to be cached. It reduces CPU overhead, but may cause some memory overhead.
#introscope.agent.sqlagent.cacheConnectionsURLs=true

###########################################
#
# SQL Result Set Row Counting
#

# Set this to true to enable SQL result set row counting
#introscope.agent.sqlagent.countrows=true

# Maximum number of result sets that are being tracked for row count
introscope.agent.sqlagent.resultsets.max=1000

#######################
# Agent Metric Clamp Configuration
#
# ================
# The following setting configures the Agent to approximately clamp the number of metrics sent to the EM  
# If the number of metrics pass this metric clamp value then no new metrics will be created.  Old metrics will still report values.
# The value must be equal to or larger than 1000 to take effect. Lower value will be rejected.
# The default value is 5000. 
# You must restart the managed application before changes to this property take effect.
introscope.agent.metricClamp=5000


#######################
# Transaction Tracer Configuration
#
# ================
# Configuration settings for Introscope Transaction Tracer

# The following settings configure Transaction Tracer to optionally
# capture the user ID used to invoke servlets and JSPs if it is stored
# in one of the three following ways.  Uncomment the set of properties
# that correspond to how user IDs are stored in your application.
# Make sure only one set of properties are uncommented or the wrong
# properties could be used.

# Uncomment the following property if the user ID is accessed through HttpServletRequest.getRemoteUser.
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.

#introscope.agent.transactiontracer.userid.method=HttpServletRequest.getRemoteUser

# Uncomment the following properties if the user ID is accessed through HttpServletRequest.getHeader.
# Make sure to set the key that is used by your application.
# Changes to these properties take effect immediately and do not 
# require the managed application to be restarted.

#introscope.agent.transactiontracer.userid.method=HttpServletRequest.getHeader
#introscope.agent.transactiontracer.userid.key=<application defined key string>

# Uncomment the following properties if the user ID is accessed through HttpSession.getValue.
# Make sure to set the key that is used by your application.
# Changes to these properties take effect immediately and do not 
# require the managed application to be restarted.

#introscope.agent.transactiontracer.userid.method=HttpSession.getValue
#introscope.agent.transactiontracer.userid.key=<application defined key string>

# Uncomment the following properties to record specific http request headers, parameters or session
#  attributes in the Transaction Tracer data.
# You must restart the managed application before changes to this property take effect.

#introscope.agent.transactiontracer.parameter.httprequest.headers=User-Agent
#Uncomment to enable the x-apm-bt request header as an option for transaction trace session criteria.  
#See "How to Monitor End User Endpoints" in the APM documentation for use
#introscope.agent.transactiontracer.parameter.httprequest.headers=x-apm-bt
#introscope.agent.transactiontracer.parameter.httprequest.parameters=parameter1,parameter2
#introscope.agent.transactiontracer.parameter.httpsession.attributes=attribute1,attribute2
introscope.agent.transactiontracer.parameter.httprequest.headers=X-Forwarded-For,X-Forwarded-Host

# Uncomment the following property to disable sessionid capture in TransactionTracer data.
# By default, it is enabled and recorded in the TT Data.

#introscope.agent.transactiontracer.parameter.capture.sessionid=true

# Uncomment the following property to specify the maximum number of components allowed in a Transaction 
# Trace.  By default, the clamp is set at 5000.   
# Note that any Transaction Trace exceeding the clamp will be discarded at the agent, 
# and a warning message will be logged in the Agent log file.
# Warning: If this clamp size is increased, the requirement on the memory will be higher and
# as such, the max heap size for the JVM may need to be adjusted accordingly, or else the 
# managed application may run out of memory.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
#introscope.agent.transactiontrace.componentCountClamp=5000

# Uncomment the following property to specify the maximum depth of components allowed in
# head filtering, which is the process of examining the start of a transaction for
# the purpose of potentially collecting the entire transaction.  Head filtering will
# check until the first blamed component exits, which can be a problem on very deep
# call stacks when no clamping is done.  The clamp value will limit the memory and
# CPU utilization impact of this behavior by forcing the agent to only look up to a
# fixed depth.  By default, the clamp is set at 30.   
# Note that any Transaction Trace whose depth exceeds the clamp will no longer be examined
# for possible collection UNLESS some other mechanism, such as sampling or user-initiated
# transaction tracing, is active to select the transaction for collection.
# Warning: If this clamp size is increased, the requirement on the memory will be higher and
# as such, garbage collection behavior may be affected, which will have an application-wide
# performance impact.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
#introscope.agent.transactiontrace.headFilterClamp=30

#
# Use compression to reduce the size of cross process tracing data. This option will increase agent CPU overhead, 
# but reduce the size of interprocess headers.
# Valid options are lzma, gzip or none. 
# LZMA compression is more efficient than GZIP, but may use more CPU.
# Note that .NET agents do not support gzip option, so if interoperability is required, do not use gzip.
introscope.agent.crossprocess.compression=lzma
# Minimum length of cross process parameter data length for which to apply compression
introscope.agent.crossprocess.compression.minlimit=1500
# Maximum size of cross process parameter data allowed.
# If total size of cross process parameter even after applying compression (if allowed) is more than this limit,
# some data will be dropped and some cross process correlation functionality will not work properly.
# However, this settings will protect user transactions from failing in network transmission due to too large header size.
introscope.agent.crossprocess.correlationid.maxlimit=4096
# Changes to above 3 properties take effect immediately and do not require the managed application to be restarted

# Uncomment the following property to disable Transaction Tracer Sampling
# Changes to this property take effect immediately and do not require the managed application to be restarted.
#introscope.agent.transactiontracer.sampling.enabled=false

# The following property limits the number of transactions that are reported by the agent 
# per reporting cycle. The default value if the property is not set is 50.
# You must restart the managed application before changes to this property take effect.
introscope.agent.ttClamp=50


#################################
# Cross Process Transaction Trace
# ===============================
# This property controls whether the presence of a tail filter triggers 
# automatic collection of traces from downstream agents or not. This property 
# does not affect collection of automatic downstream traces due to passing of
# head filters. 
# It is enabled by default. Enabling this property
# and running long periods of Transaction Trace session with tail filters can 
# cause large number of traces to be sent to the EM
# Set the property to false to disable automatic collection of downstream 
# traces due to tail filter.
# You must restart the managed application before changes to this property take effect.

introscope.agent.transactiontracer.tailfilterPropagate.enable=true

#############################
#	Application Naming
# ===========================
# This property allows to configure a Custom Application name for all the applications
# connected to this agent.  Change to this property takes effect immediately and does not
# require the managed application to be restarted.
# This property is not configured by default. 
#
#introscope.agent.application.name=Default

#######################
# URL Grouping Configuration
#
# ================
# Configuration settings for Frontend naming.  By default, frontends
# go into the group with two segments after url port 
# For example, frontend with a url http://localhost:80/abc/def/index.jsp goes to /abc/def/,
# until the number of url groups created across all apps reach a value defined in the property 
# "introscope.agent.urlgroup.frontend.url.clamp" below.
# After the clamp is reached, all frontends go into the "Default" group.
# To get customized metrics out of the Frontends|Apps|URLs tree, set up URL groups that
# are relevant to the deployment
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.urlgroup.keys=default
introscope.agent.urlgroup.group.default.pathprefix=*
introscope.agent.urlgroup.group.default.format={path_delimited:/:0:5}
introscope.agent.urlgroup.frontend.url.clamp=15

# Frontends containing the resources listed below would go into a URL group called "Resources" by default.  
# This is done so that invalid URLs (i.e.those that would generate a 404 error) and  Resource URLs do not 
# create unique, one-time metrics -- this can bloat the EM's memory. 
introscope.agent.urlgroup.frontend.url.resources.list=tif,tiff,jpg,jpeg,gif,png,bmp,bmpf,ico,cur,xbm,svg,img,css,woff,nil

# Configuration settings for Backend URL Path naming.  By default, frontends
# go into the group with two segments after url port , until the number of url
# groups created across all apps reach a value defined in the property 
# "introscope.agent.urlgroup.backend.url.clamp" below. This is hot property.
# After the clamp is reached, all backend urls go into the "Default" group.
# It is applicable for metric path Backends|WebService at {protocol}_//{host}_{port}|Paths tree.

introscope.agent.backendpathgroup.keys=default
introscope.agent.backendpathgroup.group.default.pathprefix=*
introscope.agent.backendpathgroup.group.default.format={path_delimited:/:0:5}
introscope.agent.urlgroup.backend.url.clamp=15

########################
# URL Trace Parameter Masking 
#
# ================
# The following property will enable the masking of URL trace parameter in Frontend and Servlet traces.
# It is useful in case the the executed URL has sensitive/private data which shouldn't be exposed in traces.
# The mask is same as the URL metric-group assigned, hence would only work in congruence with URL grouping configurations.
# By default the property is set as false. 
# Changes to this property take effect immediately and do not require the managed application to be restarted
introscope.agent.trace.frontend.urlmasking.enabled=false

################################################
# Webservices Namespace Grouping Configuration
#
# ================
# Configuration settings for Webservices namespace naming.  By default, webservices' namespace/service-name
# go into their actual value in the metric-string.  
# For example, Webservices with a metric: Webservices|Server|SampleNameSpace|SampleOperationName is reported as-is
# until the number of namespace/service-name groups created across all apps reach a value defined in the property 
# "introscope.agent.webservicesnamespacegroup.clamp" below.
# After the clamp is reached, all namespaces go into the "Default" group. Operationname remains unchanged. 
# To get customized metrics out please use the regex-based grouping via the properties below.  
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.webservicesnamespacegroup.keys=default
introscope.agent.webservicesnamespacegroup.group.default.pathprefix=*
introscope.agent.webservicesnamespacegroup.group.default.format={path_delimited:/:0:5}
introscope.agent.webservicesnamespacegroup.clamp=5

########################
# JMS
#
# ================
# JMS temporary destinations

# The following property will group all Queues and Topics where the destination is an instance Of javax.jms.TemporaryDestination
# under a single Investigator node.
# If you need to see these Queues/Topics, set this property to false.
# Warning: This may create a metric explosion, so you can use the jms.temporaryDestination.names 
# property to filter out the queues that are really temporary.
# Changes to this property take effect immediately and do not require the managed application to be restarted
#jms.temporaryDestination.check=false

# This property lets you specify wild character patterns to identify 
# dynamic or temporary destination names to be treated as
# 'Temporary Queues' and 'Temporary Topics' metrics.
#
# You can specify a comma separated list. You can only use wildcard (*) 
# patterns like :
#  1. XYZ* = matches if destination name starts with XYZ
#  2. *XYZ = matches if destination name ends with XYZ
#  3. *XYZ* = matches if destination name contains XYZ
#  4. XYZ = exact match
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
jms.temporaryDestination.names=*AMQ*,*$TMP$*,*CSQ*,*Temp*

# The following configuration property lets you change the constant index value used for JMS Receive Parent detection.
# JMS Receive Parent method instrumentation enables generation of transaction traces for JMS Receive as Frontend. 
# JMS Receive Parent methods are the methods reponsible for processing JMS messages after they have been received 
# by javax.jms.MessageConsumer using methods receive(), receive(long) or receiveNoWait().
# By default run()/call() methods close to 'receive' are identified as parent methods (i.e. run/call method of class implementing
# java.lang.Runnable or java.lang.Callable interface of Java). If there are no run() or call() methods in the call stack , then parent method 
# is identified based on constant index value. By default constant index value is 7. (which means the 7th call stack element above 
# receive will be marked as parent method as long as it is not a java/sun class. If 7th call stack element is a java/sun class 
# then next element (i.e 6th element above receive) will be marked as parent method.
# Change to the value of the property will only affect new parent methods that will be identified.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
# Note : Maximum value that can be provided is limited to 15.
jms.receive.parent.lookupFallback.maximumDepth=7

#######################
# Synthetic Transaction Configuration
#
# ================
# Configuration settings for synthetic transaction monitoring.
# Parameter introscope.agent.synthetic.header.names defines name(s) of HTTP headers that indicate a synthetic
# transaction.  Individual names are separated by commas.  If undefined, or empty string, synthetic transactions
# are not detected.  If multiple values defined, they are checked in order until a header is found which has
# non-null, non-empty value.  The header value will be used to create synthetic transaction name (and thus node
# name(s) under which metrics for the transaction) as follows:
# If header name is 'lisaframeid', the transaction name 'CA LISA' will be used.  If header name is anything other
# than 'lisaframeid' or 'x-wtg-info', value of header (with appropriate modification to ensure node name is valid)
# will be used as synthetic transaction name.  If header name is 'x-wtg-info', the header value is expected to
# contain sequence of attributes as name, value pairs separated by ampersands symbols.  Attribute name and value
# within each pair, are separated by equals sign.  The values of 'group', 'name', 'ipaddress' and 'request_id'
# attributes, separated by '|', are used to form synthetic transaction name.   For example the x-wtg-info header:
# clear synthetic=true&instance=ewing&name=sample&group=SampleGroup&version=4.1.0&ipaddress=192.168.193.1&sequencenumber=1&request_id=start&executiontime=1226455047
# would result in metrics being reported under node 'SampleGroup|sample|192.168.193.1|start'.  Any attributes which are
# not defined in x-wtg-info header have default values supplied as follows: group=unknownGroup, name=unknownScript,
# ipaddress=0.0.0.0 and request_id=Action.  Final node name is modified if required to ensure it is valid.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
#introscope.agent.synthetic.header.names=Synthetic_Transaction,x-wtg-info,lisaframeid

# The following configuration parameters with names starting 'introscope.agent.synthetic.' are ignored if
# parameter introscope.agent.synthetic.header.names is undefined. 
# Parameter introscope.agent.synthetic.user.name defines name of HTTP header whose value holds name of 
# synthetic user.  If undefined, nodes for each unique synthetic user will not be created.  Synthetic user
# names will be modified if required to ensure they are valid node names.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.synthetic.user.name=Synthetic_Trace_By_Vuser
# Node under which transactions recognised as synthetic are reported.  This node will be located under
# Frontends|Apps|<WebAppName> where <WebAppName> is web application name.  Defaults to 'Synthetic Users'
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.synthetic.node.name=Synthetic Users
# Node under which transactions not recognised as synthetic are reported..  This node will be located under
# Frontends|Apps|<WebAppName> where <WebAppName> is web application name.  If not defined, no additional node
# under <WebAppName> is created.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.non.synthetic.node.name=Real Users

#######################
# Error Detector Configuration
#
# ================
# Configuration settings for Error Detector

# Please include errors.pbd in your pbl (or in introscope.autoprobe.directivesFile)

# The error snapshot feature captures transaction details about serious errors
# and enables recording of error count metrics.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.errorsnapshots.enable=true

# The following series of properties lets you specify error messages 
# to ignore. For errors with messages matching these filters,
# error snapshots and error metrics will not be generated or sent.  
# You may specify as many as you like (using .0, .1, .2 ...). You may use wildcards (*).  
# The following are examples only.
# Changes to this property take effect immediately and do not require the managed application to be restarted.
#introscope.agent.errorsnapshots.ignore.0=*com.company.HarmlessException*
#introscope.agent.errorsnapshots.ignore.1=*HTTP Error Code: 404*

# The following setting configures the maximum number of error snapshots
# that the Agent can send in a 15-second period.
# You must restart the managed application before changes to this property take effect.
introscope.agent.errorsnapshots.throttle=10

# Minimum threshold for stall event duration
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.stalls.thresholdseconds=30

# Frequency that the agent checks for stall events
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.stalls.resolutionseconds=10


########################
# TT Sampling
# ================
# These are normally configured in the EM. Configuring in the Agent disables configuring
# them in the EM
# Changes to this property take effect immediately and 
# do not require the managed application to be restarted.
#
introscope.agent.transactiontracer.sampling.perinterval.count=6
introscope.agent.transactiontracer.sampling.interval.seconds=60

#######################
# Remote Configuration Settings
#
# ================
# Configuration settings for remote configuration

# Enable/disable remote configuration of agent
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.remoteagentconfiguration.enabled=true

# The exact list of files that are allowed to be remotely transferred to this agent
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.remoteagentconfiguration.allowedFiles=domainconfig.xml

#######################
# Bootstrap Classes Instrumentation Manager
#
# ================
# Configuration settings for the bootstrap classes instrumentation manager

#enable/disable bootstrap manager. If set to false, no system classes will be 
#instrumented. If the property is not set, the default value is false.
#You must restart the managed application before changes to this property take effect.
introscope.bootstrapClassesManager.enabled=true 

#Define a wait time in seconds at startup before instrumenting bootstrap classes 
introscope.bootstrapClassesManager.waitAtStartup=5

#######################
# Remote Dynamic Instrumentation Settings
#
# ================
# Configuration settings for remote dynamic instrumentation 

# Enable/disable the remote management of dynamic instrumentation 
# You must restart the managed application before changes to this property take effect.
# For Tomcat User, we support remote dynamic instrumentation only for java 6 or above
# If you are deploying on a Java 6 or above, you may change this
# property to be true
introscope.agent.remoteagentdynamicinstrumentation.enabled=false 

#######################
# Dynamic Instrumentation Settings 
# ================================= 
# This feature enables changes to PBDs to take effect without restarting the application server or the agent process.  
# This is a very CPU intensive operation, and it is highly recommended to use configuration to minimize the classes that are 
# being redefined.PBD editing is all that is required to trigger this process. 
  
# Enable/disable the dynamic instrumentation feature. 
# You must restart the managed application before changes to this property take effect.
introscope.autoprobe.dynamicinstrument.enabled=true

# The polling interval in minutes to poll for PBD changes 
# You must restart the managed application before changes to this property take effect.
#introscope.autoprobe.dynamicinstrument.pollIntervalMinutes=1 
    
# Some classloader implementations have been observed to return huge class files.This is to prevent memory errors.
# You must restart the managed application before changes to this property take effect. 
#introscope.autoprobe.dynamicinstrument.classFileSizeLimitInMegs=1 

# Re-defining too many classes at a time might be very CPU intensive. In cases where the changes in PBDs trigger 
# a re-definition of a large number of classes,this batches the process at a comfortable rate.
#introscope.autoprobe.dynamic.limitRedefinedClassesPerBatchTo=10
  

# Deep Inheritance Settings
# =========================
# This property enables deep inheritance instrumentation through PBD directives. If set to false, deep inheritance directives
# will behave as shallow inheritance, i.e. will not recognize inheritance relations beyond the immediate superclass or interfaces.
# The default value is true.
# You must restart the managed application before changes to this property take effect.
introscope.autoprobe.deepinheritance.enabled=true

# When deep inheritance is enabled, the following parameters takes effect.
# This property controls if deep inheritance will be automatically turn off when it takes too much time.
# When it is true, deep inheritance is automatically turn off when it takes too much time. 
# When it is false, deep inheritance is not automatically turn off and it continues even when it takes a lot of time; 
# The default is true
# You must restart the managed application before changes to this property take effect.
introscope.autoprobe.deepinheritance.auto.turnoff.enable=true

# When deep inheritance auto turn off is enabled, the following parameters takes effect
# The auto turn off works in the following way
# 	When the time spent on deep inheritance since application start exceeds total max time
# 	deep inheritance is turn off
# 	Otherwise, when the number of requests in a checking interval exceeds the configured value,
# 		the time spent on deep inheritance is compared with the max time allowed in this interval.
#		If the time spent is larger than the configured max time in an interval, deep inheritance is automatically turn off
#		Otherwise, the time spend and the number of requests in this checking interval are reset for next interval
#
# This property specifies the number of requests in a checking interval. 
# The default is 100
# You must restart the managed application before changes to this property take effect.
introscope.autoprobe.deepinheritance.auto.turnoff.requests.per.interval=100

# This property specifies the max time allowed in a checking interval in millisecond. 
# The default is 12000
# You must restart the managed application before changes to this property take effect.
introscope.autoprobe.deepinheritance.auto.turnoff.maxtime.per.interval=12000

# This property specifies the total max time deep inheritance can spend since application starts. It is 
# in millisecond. If this value is exceeded, deep inheritance is disabled. 
# The default is 120000
# You must restart the managed application before changes to this property take effect.
introscope.autoprobe.deepinheritance.auto.turnoff.maxtime.total=120000

  
# Multiple Inheritance Settings 
# ============================== 
# For directives based on interfaces or super classes the agent is unable to detect  
# multiple inheritance and hence those classes are not instrumented.Enable this feature to  
# determine those cases after the appserver or the agent process starts up.This feature logs the  
# classes which need to be instrumented but have not been and relies on dynamic instrumentation to affect the changes. 
  
  
# Enable/disable the hierarchy support instrumentation feature. 
# This is a hot property so only save the file after changing. Agent does not need restarting.
#introscope.autoprobe.hierarchysupport.enabled=true 
  
# Since most cases have the applications already deployed, the behavior needs to run only once 
# to detect uninstrumented classes. Unless new applications are deployed after this behavior runs, 
# it need not be run again.Change this to true only if you need detection on a periodic basis. 
# The default value is true, i.e. it runs only once. 
# You must restart the managed application before changes to this property take effect.
#introscope.autoprobe.hierarchysupport.runOnceOnly=false 
  
# The polling interval to check for classes which could not be instrumented due to multiple inheritance. 
# Since in most cases this will happen only once, a conservative value is recommended to account for  
# app server initialization. 
# You must restart the managed application before changes to this property take effect.
#introscope.autoprobe.hierarchysupport.pollIntervalMinutes=5
  
# If you need the behavior to run a finite times instead of running it only once/ running it periodically always 
# use this property to specify the exact number of times it should run.Using this over-rides the run once only setting. 
# You must restart the managed application before changes to this property take effect.
#introscope.autoprobe.hierarchysupport.executionCount=3 
  
# Uncomment this if you dont need to log the classes being detected.This would make sense only  
# if dynamic instrumentation is enabled. 
# You must restart the managed application before changes to this property take effect.
#introscope.autoprobe.hierarchysupport.disableLogging=true 
  
# Uncomment this to only log the changes and disable the triggering of dynamic instrumentation. 
# You must restart the managed application before changes to this property take effect.
#introscope.autoprobe.hierarchysupport.disableDirectivesChange=true 
  
# Log4j Settings for this feature- these settings would create a log file called pbdupdate.log in  
# the current directory of the application. 
# You must restart the managed application before changes to this property take effect.
#log4j.additivity.IntroscopeAgent.inheritance=false 
#log4j.logger.IntroscopeAgent.inheritance=INFO,pbdlog 
  
#log4j.appender.pbdlog.File=pbdupdate.log 
#log4j.appender.pbdlog=com.wily.introscope.agent.AutoNamingRollingFileAppender 
#log4j.appender.pbdlog.layout=com.wily.org.apache.log4j.PatternLayout 
#log4j.appender.pbdlog.layout.ConversionPattern=%d{M/dd/yy hh:mm:ss a z} [%-3p] [%c] %m%n_ 



################################
# Agent Metric Aging
# ==============================
# Detects metrics that are not being updated consistently with new data and removes these metrics.
# By removing these metrics you can avoid metric explosion.    
# Metrics that are in a group will be removed only if all metrics under this group are considered candidates for removal.
# BlamePointTracer metrics are considered a group.  
#
# Enable/disable the metric agent aging feature. 
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.metricAging.turnOn=true
#
# You can choose to ignore metrics from removal by adding the metric name or metric filter to the list below.  
# Changes to this property take effect immediately and do not require the managed application to be restarted.
introscope.agent.metricAging.metricExclude.ignore.0=Threads*

# To ignore ChangeDetector.AgentID  metric from metric aging.
introscope.agent.metricAging.metricExclude.ignore.1=ChangeDetector.AgentID

# To ignore File System metrics from metric aging.
introscope.agent.metricAging.metricExclude.ignore.2=File System*


#########################################
# Servlet Header Decorator
# =======================================
# On/Off Switch
#
# ================
# If this Boolean value is set to true, it configures the agent to add
# additional performance monitoring information to HTTP response
# headers.  ServletHeaderDecorator attaches the GUID to each transaction 
# and inserts the GUID into an HTTP header, x-wily-info
# This enables the correlation of transaction between Wily CEM and Wily Introscope
# Changes to this property take effect immediately and do not require the 
# managed application to be restarted.

introscope.agent.decorator.enabled=false
#######################
# Security
#
# Determine the format of decorated HTTP response headers, which are sent to Wily CEM.
# clear - clear text encoding
# encrypted - header data is encrypted
# default is encrypted
#
introscope.agent.decorator.security=encrypted



#########################################
# ChangeDetector configuration properties
# =======================================
# On/Off Switch
#
# ================
# This boolean property gives you the ability to enable
# Introscope ChangeDetector by settings the property value
# to true. It is set to false by default.
# You must restart the managed application before changes to this property take effect.
#introscope.changeDetector.enable=false
#######################
# Root directory 
#
# ================
# The root directory is the folder where ChangeDetector creates its local cache files. 
# Use a backslash to escape the backslash character, as in the example.   
#introscope.changeDetector.rootDir=c:\\sw\\AppServer\\wily\\change_detector
#######################
# Startup wait time 
#
# ================
# Time to wait after agent starts before trying to connect to the Enterprise manager
#introscope.changeDetector.isengardStartupWaitTimeInSec=15
#######################
# Interval between connection attempts
#
# ================
# Specify the number of seconds to wait before retrying connection to the Enterprise manager
#introscope.changeDetector.waitTimeBetweenReconnectInSec=10
#######################
# Agent ID
#
# ================
# A string used by ChangeDetector to identify this agent
#introscope.changeDetector.agentID=SampleApplicationName
#
#######################
# Data source configuration file path 
#
# ================
# The absolute or relative path to the ChangeDetector datasources configuration file.
# Use a backslash to escape the backslash character.   
#introscope.changeDetector.profile=../../common/ChangeDetector-config.xml
#
#######################
# Data source configuration file directory
#
# ================
# The absolute or relative path to the datasource configuration file(s) directory.
# Use a backslash to escape the backslash character.
# All datasource configuration file(s) from this directory will be used in addition
# to any file specified by introscope.changeDetector.profile property.
#introscope.changeDetector.profileDir=changeDetector_profiles
#
#######################
# Data Compression 
#
# ================
# Enabling these properties will allow compression on the 
# Change Detector data buffer. This could be useful 
# if you experience memory consumption at start-up 
# Default property value is "false"
# You must restart the managed application before changes to this property take effect.
#
#introscope.changeDetector.compressEntries.enable=true
#
# The following property defines the batch size for the compression job
# You must restart the managed application before changes to this property take effect.
#introscope.changeDetector.compressEntries.batchSize=1000


#######################
# Application Map Agent Side
#
# ================
#Enable/disable tracking in the monitored code for Application Map
#Default value is false
#introscope.agent.appmap.enabled=true

#Enable/disable tracking of metrics for app map nodes. 
#Default value is false
#introscope.agent.appmap.metrics.enabled=true

#Enable/disable sending additional information for integration with catalyst
#default value is false
#introscope.agent.appmap.catalystIntegration.enabled=true

#Set the buffer size for app map data
#default value is 1000. Must be a positive integer. If the value is set to 0, the buffer is 
#unbounded. 
#introscope.agent.appmap.queue.size=1000

#Set the frequency in milliseconds for sending app map data to the EM.
#default value is 1000. Must be a positive integer. 
# If the value is set to 0, the default value is used.
#introscope.agent.appmap.queue.period=1000

#Enable/disable sending additional intermediate nodes between application frontend and 
# backend nodes.
#Default value is false.
# Change to this property takes effect immediately and do not require the managed application to be restarted.
#introscope.agent.appmap.intermediateNodes.enabled=true

#For the AppMapMarkerTracers, we can set the properties that define if they sending
# Class or MethodClass level information
#[Class] will enable to report Class level application edge to Application map
#[MethodClass] will enable to report Method Class level application edge to Application map
introscope.agent.appmap.levels.enabled=MethodClass


#For the AppMapMarkerTracers, we can set the properties that define if they sending
# information for Application or Business Transactionowners
#[Application] will enable to report applciation owners
#[BusinessTransactionComponent] will enable to report BTC owners
introscope.agent.appmap.owners.enabled=Application,BusinessTransactionComponent

######################
# Application Map and Socket
#
# ==================
# Enable/Disable sockets to appear in application map
# All the properties below need restart to the managed application 
# before changes to this property take effect.

#Enables Managed sockets to appear in Application map
#Default value true
introscope.agent.sockets.managed.reportToAppmap=true

#Enables Managed sockets to report Class level application edge to Application map
#Default value false
introscope.agent.sockets.managed.reportClassAppEdge=false


#Enables Managed sockets to report Method level application edge to Application map
#Default value true
introscope.agent.sockets.managed.reportMethodAppEdge=true


#Enables Managed sockets to report Class level Business Txn edge to Application map 
#Default value false 
introscope.agent.sockets.managed.reportClassBTEdge=false

#Enables Managed sockets to report Method level Business Txn edge to Application map 
#Default value true
introscope.agent.sockets.managed.reportMethodBTEdge=true

#######################
# Business Recording 
#
# ================
# Enable/disable business recording
# You must restart the managed application before changes to this property take effect.
introscope.agent.bizRecording.enabled=true
#

# Never attempt to match POST parameters. This option is fastest, but may result in inaccurate business transaction component matching
#introscope.agent.bizdef.matchPost = never

# Match POST parameter patterns after servlet has executed. Cross process mapping and some metrics will not be available.
# This option is only available when the agent is run in pre-9.1 mode. 
#introscope.agent.bizdef.matchPost = after

# Match POST parameter patterns before the servlets execute. 
# This option may require to define which urls are using directly the input stream
# or the reader of the request, and therefore must be vetoed to be matched against 
# post parameters. 
introscope.agent.bizdef.matchPost = before

# Following is list of pre configured URLs (with out host part) that are excluded from post parameter
# processing. Usually because it is known that they access servlet stream directly. 
# This is a comma separated list, where each item can optionally end with '*' to denote
# that it's a URL prefix. '*' is not allowed in any other position than end.
introscope.agent.bizdef.matchPost.vetoedURI=

#######################
# Garbage collection and Memory Monitoring 
#
# ================
# Enable/disable Garbage Collection monitor
# Changes to following property take effect immediately and do not require the managed application to be restarted.

introscope.agent.gcmonitor.enable=true

######################################################
# Thread Dump Collection
######################################################

# Enable/disable Thread Dump Feature support.
introscope.agent.threaddump.enable=true

# Enable/disable DeadLock poller Metric support.
introscope.agent.threaddump.deadlockpoller.enable=false

# The property determines the interval in which the Agent queries for any deadlock in the system.
introscope.agent.threaddump.deadlockpollerinterval=15000

#######################
# Primary network interface selector
#
# Agent reports details of host computer's primary interface (IP address, MAC address, host & domain name). 
# If following property is unset, agent will attempt to determine an appropriate interface as the primary
# interface.  If an alternate interface is required, uncomment following property and specify required 
# interface identity.
# Change to this property takes effect immediately and do not require the managed application to be restarted.
#
#introscope.agent.primary.net.interface.name=eth0.0

###################
# Default Backend Legacy
#
# The default backend feature behavior has changed to include methods marked as frontend
# in the detection of socket calling. 
# The following property will set the default backend detection to run as in 
# 9.0.x release. By default, the value of the property of false.
# You must restart the managed application before changes to this property take effect.
# 
#introscope.agent.configuration.defaultbackends.legacy=false


#######################
#  Transaction Structure aging properties
#
# ================
# This property is to evaluate the number of elements in the transaction structure at the period interval,
# to determine if "emergency aging" is required.
# Default value is "30000"
# com.wily.introscope.agent.harvesting.transaction.creation.checkperiod=30000       

# This property specifies the period in milliseconds that the aging for the transaction structure is checked, 
# Default value is "30000"
# com.wily.introscope.agent.harvesting.transaction.aging.checkperiod=30000
 
# This property specifies the minimum amount in milliseconds that a tree in the transaction structure must be inactive before it is purged.
# The inactivity does not imply that it will be aged out.
# Default value is "60000"
# com.wily.introscope.agent.harvesting.transaction.aging.period=60000 
             
# This property sets the maximum percentage increment in the size of the structure that is allowed to happen before aging of the transaction structure is forced
# If the change in the number of nodes between the aging periods is more than this percentage value, then checking for aging occurs
# if set to a small value, the transaction structure will be aged more frequently, and the memory utilization of the agent will be therefore 
# kept lower.
# Default value is "5", i.e. 5%
# com.wily.introscope.agent.harvesting.transaction.aging.attentionlevel.percentage=5        
 
# This property sets the maximum absolute increment in the size of the structure that is allowed to happen before aging of the transaction structure is forced
# If the change in the number of nodes between the aging periods is more than this percentage value, then checking for aging occurs
# if set to a small value, the transaction structure will be aged more frequently, and the memory utilization of the agent will be therefore 
# kept lower.
# Default value is "100000"
# com.wily.introscope.agent.harvesting.transaction.attentionlevel.absolute=100000

# This property is used to avoid spikes in memory utilization of the transaction structure.
# If there is an increase of elements at any time bigger than a third of this value,
# then "emergency aging" occurs immediately. Emergency aging will agent parts of the transaction structures that are younger than the 
# value specified in com.wily.introscope.agent.harvesting.transaction.aging.period,  and will likely reduce the amount of data sent by the agent.
# Only modify this value if the memory requirement are very strict. 
# Default value is "100000"
# com.wily.introscope.agent.harvesting.transaction.creation.attentionlevel.absolute=100000

# This property specifies the maximum duration in milliseconds of the aging process. It is used to avoid long aging process when 
# resources available are not sufficient. 
# default value if 30000
# com.wily.introscope.agent.harvesting.transaction.aging.duration.max=30000
 
#######################
#  Transaction Structure properties
#
# ================
# Enable/disable to shut down globally the transaction trace feature.
# Default value is "true"
# com.wily.introscope.agent.blame.transaction.doTransactionTrace=true

# Enable/disable high concurrency mode for all repositories.
# Set to true, it will use more memory but may give more throughput
# Default value is "false"
# com.wily.introscope.agent.blame.highconcurrency.enabled=false

# This property defines the number of stripes in the striped repositories
# It works when the high concurrency mode is on,
# which is "com.wily.introscope.agent.blame.highconcurrency.enabled=true"
# Default value is "16"
# com.wily.introscope.agent.blame.highconcurrency.stripes=16

# Enable/disable to removes stalls from all traces, and remove stall feature altogether.
# Default value is "true"
# com.wily.introscope.agent.blame.stall.trace.enabled=true

# Enable synchronized repositories instead of compare and swap repositories
# The synchronized repository is not used in java5 because of overhead in locking.
# the default value is true in java 6 and above, and false for java 5. In java 5, setting to false will cause overhead
# com.wily.introscope.agent.blame.synchronized.enabled=true

 
#######################
# Properties to activate sustainability metrics
#
# ================
# Sustainability metrics are generated to provide information on the agent health and
# internal status. There is a substantial overhead associated with these metrics, and therefore, their
# usage is not suggested at this time in production environments.
#
# Enable/disable to generate globally sustainability debug metrics.
# Set to true, it will generate globally sustainability debug metrics that can be used to evaluate the Transaction Structure
# Default value is "false"
# com.wily.introscope.agent.blame.transactions.debugmetrics.enabled=false           

# Enable/disable to generate sustainability metrics on the harvesting process.
# Default value is "true"
com.wily.introscope.agent.harvesting.debugmetrics.enabled=true

# This property is to generate the metrics for the health of the data structures in the agent.
# Default value is "true"
concurrentMapPolicy.generatemetrics=true
 


#######################
# Socket Clamp level property
#
# ================
# This property controls the total number of sockets monitored by the agent. 
# Once the clamp value is reached, the agent does not monitor additional sockets.
# No new socket metrics will be displayed when this clamp is reached.
# If client and server socket are on the same JVM, they will be counted as two sockets for this clamp.
# You must restart the managed application before changes to this property take effect.
# Default value is 100.
# Warning: Increasing the value of the default setting will cause significant memory overhead.
# com.wily.introscope.agent.sockets.clamp.level=100

##############################################
# Smart Instrumentation properties
#
##############################################
#
#-------------------------------------
# Note: The following describes the functional behaviour on combination of the two properties 
# introscope.agent.deep.instrumentation.enabled and introscope.agent.deep.trace.enabled
#
# 1. The introscope.agent.deep.instrumentation.enabled property must be enabled
#    for the introscope.agent.deep.trace.enabled property to function.
#
# 2. When introscope.agent.deep.instrumentation.enabled=true and introscope.agent.deep.trace.enabled=true,
#    the agent automatically instruments deep transaction trace components and collects deep transaction traces.
#
# 3. When introscope.agent.deep.instrumentation.enabled=true and introscope.agent.deep.trace.enabled=false,
#    the agent automatically instruments deep transaction trace components.
#    However no deep transaction trace component data is sent to the Enterprise Manager or displayed.
#--------------------------------------
#
# Enables and disables deep transaction trace visibility.
# Enables and disables the agent ability to automatically instrument transaction trace components
# without PBD configuration to provide deep transaction trace visibility.
# The default value is true.
# You must restart the managed application before changes to this property take effect
introscope.agent.deep.instrumentation.enabled=true

# Enables and disables the agent ability to collect deep transaction traces
# and send the data to the Enterprise Manager.
# The default value is true.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.trace.enabled=true

# This property determines how much of the code is instrumented. The valid
# values are low, medium, high. Low means few methods are instrumented, and 
# high means a lot of methods are instrumented.
# Change to this property will cause performance degradation when system is under high load.
# Use with caution.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.instrumentation.level=high

# When smart instrumentation level is changed, the classes are reloaded in batches. 
# This property specifies number of classes that are re-loaded per batch.
# Increasing the value of this property will cause performance degradation when system is under high load.
# Use with caution.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.instrumentation.level.batch.size=5

# When smart instrumentation level is changed, the classes are reloaded in batches. 
# This property specifies time interval in minutes between batches.
# Decreasing the value of this property will cause performance degradation when system is under high load.
# Use with caution.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.instrumentation.level.batch.interval=2

# This property enables and disables deep component visibility into error snapshots
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.errorsnapshot.enable=true

# This property enables / disables the deep stall snapshots.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.stallsnapshot.enabled=true

# This property limits the number of methods that the agent can automatically Instrument without PBD instrumentation
# You must restart the managed application before changes to this property take effect
introscope.agent.deep.instrumentation.max.methods=10000

# This property limits the maximum number of deep trace components in a Transaction Trace
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.trace.max.components=1000

# This property limits the maximum number of consecutive deep trace components in a Transaction Trace
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.trace.max.consecutive.components=15

#Set of package prefixes that should be scored low as they're unlikely to be relevant to transactions
# You must restart the managed application before changes to this property take effect
introscope.agent.deep.instrumentation.custom.prefixes=java

# Enables or disables introscope to automatically collect  transaction traces.
# Note: does not apply to sampled transaction traces
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.automatic.trace.enabled=true

# Clamps the number of automatic traces collected by Introscope per 1 minute interval. 
# If > 5, due to http protocol header limitations, can result in not seeing cross-process transactions in automatic transaction traces.
# Note: does not apply to sampled transaction traces.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.automatic.trace.clamp=5

# Enables and disables the cross-process support for automatic transaction tracing.
# Note: To see cross-process transactions in automatic transaction traces, these properties must also be set to true:	
# 1. introscope.agent.deep.trace.enabled
# 2. introscope.agent.deep.instrumentation.enabled
# 3. introscope.agent.deep.automatic.trace.enabled
# The default value is true.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.deep.automatic.trace.crossprocess.enabled=true

# Enables automatic entry point detection.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
# Note: 
# A AutoPersist.pbd could be generated in hotdeploy directory when this property is set to true,
# and it won't be removed automatically when this property is set to false.
# To remove previously detected entry points, please delete AutoPersist.pbd in hotdeploy directory.
introscope.agent.deep.entrypoint.enabled=true

# Package prefix for classes to be skipped  for consideration as entry points.
# You must restart the managed application before changes to this property take effect.
introscope.agent.deep.entrypoint.skip.pkgs=

# Maximum number of traced entry points and automatic backends that can be persisted in the AutoPersist pbd.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.autopersist.instrumentation.count.max=60

# Enables automatic backend detection.
# Change to this property takes effect immediately and does not require the 
# managed application to be restarted.
introscope.agent.automatic.backend.detection.enabled=true

# Package prefix for classes to be skipped for consideration as automatically detected backends.
# For example, when introscope.agent.automatic.backend.detection.skip.pkgs=com.abc,com.xyz
# the agent skips classes belonging to the 'com.abc' and 'com.xyz' packages to be detected as automatic backends.
# You must restart the managed application before changes to this property take effect.
introscope.agent.automatic.backend.detection.skip.pkgs=

##############################################
# External Business Transaction Monitoring properties
##############################################

# Turn on/off the External Business Transaction Monitoring feature
# Changes to this property take effect immediately and do not require the 
# managed application to be restarted.
# The default value is true.
introscope.agent.external.biz.enabled=true

# Maximum data size for External Business Transaction header parameter (x-apm-bt). The unit is 1KB. 
# A request with a parameter exceeding this limit will not be processed as External Business Transaction.
# Changes to this property take effect immediately and do not require the 
# managed application to be restarted.
# The default value is 10.
introscope.agent.external.biz.header.size.max=10

# Maximum number of External Business Transactions allowed.
# Changes to this property take effect immediately and do not require the 
# managed application to be restarted.
# The default value is 100.
introscope.agent.external.biz.bt.count.max=100

##############################################
# Browser Agent Business Transaction Monitoring properties
##############################################
#
#-------------------------------------
# NOTICE:  The CA Browser Agent is owned and/or licensed by CA Technologies ("CA"). 
# An active license agreement for CA Application Performance Management (CA APM) ("License Agreement") is required for its use.  
# Your use of this product is governed by the terms of the License Agreement.
# If you do not have an active CA APM License Agreement with CA, you may not use this product.  For details, please contact CA.
# In order to use the CA Browser Agent, you must deploy a CA Experience Collector or have access to one to receive the data.
#-------------------------------------

##############################################
# Turn on/off the Browser Agent sustainability metrics 
# Changes to this property take effect immediately and do not require the
# managed application to be restarted.
# The default value is true.
#introscope.agent.browseragent.sustainabilityMetrics.enabled=true
 
# The following properties pertain to automatically insert JavaScript monitoring which 
# uses regex patterns to match request URL and insert the snippet code 
# from a user defined snippet file into the response. 
 
# Turn on/off Browser Agent automatic JavaScript snippet injection.
# Change to this property takes effect immediately and do not require the 
# managed application to be restarted.
# The default value is false.
introscope.agent.browseragent.autoInjectionEnabled=false

# This property specifies the group keys for Browser Agent automatic JavaScript snippet injection.
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
introscope.agent.browseragent.autoInjection.appID=default

# This property specifies the file path for the snippet file 
# and the file extension must be "basnippet". Either an absolute path or a path relative to the browser agent extension jar.
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
introscope.agent.browseragent.autoInjection.default.snippetLocation=../config/default.basnippet

# This property specifies the (Java based) regular expression patterns, which are 
# used to match against the request URLs for Browser Agent automatic JavaScript snippet injection.
# Changes to this property take effect immediately and do not 
# require the managed application to be restarted.
# Format example: introscope.agent.browseragent.autoInjection.default.includeURLsRegex=.*/mypage.jsp
# Here, the example matches all URLs with path "/mypage.jsp".
introscope.agent.browseragent.autoInjection.default.includeURLsRegex=.*
 
# This property specifies the maximum content length (in bytes) for searching <head> or <body> tag.
# Changes to this property take effect immediately and do not require the
# managed application to be restarted.
# The default value is 32768 bytes.
#introscope.agent.browseragent.autoInjection.snippet.maxSearchingLength=32768
 
# The following set of properties pertain to Browser Agent response decoration, where  
# the response decoration carries APM business transaction information and end to end APM transaction correlation.
 
# Turn on/off the Browser Agent response decoration used for 
# business transaction matching support and end to end transaction trace correlation 
# Change to this property takes effect immediately and do not require the 
# managed application to be restarted.
# The default value is false.
introscope.agent.browseragent.response.decoration.enabled=false
 
# This property specifies the expiration time of the browser agent response cookie in the browser.
# Change to this property takes effect immediately and do not require the 
# managed application to be restarted.
# The default value is 3 seconds.
#introscope.agent.browseragent.response.decoration.cookie.expirationTime=3
 
# This property specifies the regex pattern that will be used
# to match against the request URL for adding browser agent response decoration.
# Change to this property takes effect immediately and do not require the 
# managed application to be restarted.
# Format example: introscope.agent.browseragent.response.decoration.includeURLsRegex=.*/mypage.jsp
# Here, the example matches all URLs with path "/mypage.jsp".
introscope.agent.browseragent.response.decoration.includeURLsRegex=.*

# This property specifies the CA Experience Collector host that will be used
# in the snippet file to complete the url for downloading the JavaScript file 
# and sending performance data to the CA Experience Collector.
# The default value is localhost. You do not need to set this property if you are using AXA.
introscope.agent.browseragent.dxchost=localhost

# This property specifies the CA Experience Collector port that will be used 
# in the snippet file to complete the url for downloading the JavaScript file 
# and sending performance data to the CA Experience Collector.
# The default value is 80. You do not need to set this property if you are using AXA.
introscope.agent.browseragent.dxcport=80

# This property specifies whether SSL should be enabled in downloading 
# the Javascript file and sending performance data to the CA Experience Collector.
# The default value is false.
introscope.agent.browseragent.ssl.enable=false

##################################################################
# Properties to activate Agent Controller Registration Extension
#
# ================
#
# Enable/disable Agent Controller Registration Extension.
# Set to true, it will allow the running APM Agent
# to register with the local Agent Controller.
# Default value is false.
# It is a hot property so only save the file after changing.
# Agent does not need restarting.
introscope.agent.acc.enable=true
#
# The port used to contact the Agent Controller. Default value is 51914
# introscope.agent.acc.port=51914

##############################################################################
# Property to enable/disable SOA Dependency tracers and service
#
# ================
#
# Default value is false.
# You must restart the managed application before changes to this property take effect. 
com.wily.introscope.agent.soa.mapdependency.enabled=false

