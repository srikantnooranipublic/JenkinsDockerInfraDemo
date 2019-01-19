#!/bin/sh

# This script is used to restore a database backup from a stored backup file

usage()
{
  echo "This program restores a database backup."
  echo "Required arguments <dbserverhostip> <dbinstalldir> <dbserviceuser> <dbservicepassword> <dbname> <dbuser> <dbpassword> <dbport> <backupFile>"
  exit 1
}

# exit if any of the postgres encountered any error or warning ; setting the flag ; for now commenting
#set -e

postgresServer=$1
postgresInstallDir=$2
postgresServiceUser=$3
postgresServicePwd=$4
postgresDbName=$5
postgresUser=$6
postgresPwd=$7
postgresPort=$8
backupFile=$9
is64bit=false
targetSchemaVersion="10.6.0.0"

if 
  [ $# -ne 9 ]; then 
  usage; 
fi

if [ -x "$postgresInstallDir/bin/pg_restore" ]; then
  echo ""
elif [ -x "$postgresInstallDir/bin/64/pg_restore" ]; then
  is64bit=true
else  
  echo "'$postgresInstallDir' does not seem to point to a PostgreSQL installation. Exiting..."
  exit
fi

if (file "$postgresInstallDir/bin/psql" | grep "ELF 64-bit" ) > /dev/null; then
is64bit=true
fi

if [ ! -e "$backupFile" ]; then
   	echo "The file '$backupFile' does not exist.  Exiting..."
  exit
fi

# Check that we can reach "java" (which is used in dbupgrade.sh) here so that we don't wait until after the db has
# been restored (which could potentially take a long time) to find out that we cannot execute the upgrade script.
# We don't always drop the jre as part of our installation so we can't assume its location.

# start by checking our assumed location, if not there then ask the user to tell us which JRE to use 
#javaExe=../../../jre/bin/java

#if [ -x "$javaExe" ]; then
  #echo ""
#elif [ -z "$JAVA_HOME" ] ; then
  #echo "JAVA_HOME is not set.  Please set the environment variable JAVA_HOME to point to your JRE (1.6 or higher) root folder."
  #exit
#fi


export PATH="$postgresInstallDir/bin:$postgresInstallDir/bin/64:$PATH"

# Confirm that the postgres version being used is one we support

# get version string which will be in the form of "PostgreSQL 8.3.7"
postgres_version_str=$(pg_restore --version)

# Strip all non numerics to capture version number
postgres_version=$(echo ${postgres_version_str//[^0-9]/})

if [ $postgres_version -lt 835 ]; then
	echo "$postgres_version_str is not supported.  Please upgrade to a newer version of CEM to get a newer PostgreSQL.  Exiting..."
	exit
fi

# See if db already exists
cmd="PGUSER="$postgresServiceUser" PGPASSWORD="$postgresServicePwd" psql -d template1 -q -t --pset format=unaligned -h $postgresServer -p $postgresPort -c \"select count(1) from pg_catalog.pg_database where datname = '$postgresDbName'\""
db_count=`eval $cmd`

# Drop the database if it exists
if [ $db_count -eq 1 ] ; then
    if PGUSER="$postgresServiceUser" PGPASSWORD="$postgresServicePwd" psql -h $postgresServer -p $postgresPort -d $postgresDbName -f /dev/null 2> /dev/null; then
       echo 'Dropping database "'$postgresDbName'"'
       PGUSER="$postgresServiceUser" PGPASSWORD="$postgresServicePwd" dropdb -h $postgresServer -p $postgresPort "$postgresDbName"
  
       # see if we were successful in dropping the db, if not AND it already exits, exit
       if [ "$?" -eq "1" ]; then
           exit 1
       fi  
    fi
fi  

# Create the new database
#echo 'Creating database "'$postgresDbName'" with the specified user as the owner.'
PGUSER="$postgresServiceUser" PGPASSWORD="$postgresServicePwd" createdb -h $postgresServer -p $postgresPort -E unicode -O "$postgresUser" -T template0 "$postgresDbName"

# restore the database data
echo 'Restoring the database data. The restore may take a long time depending on the size of the backup file.'
# Using "postgresUser" to connect to DB along with option "-O" to make "postgresUser" owner of all restored objects (fix for TT60019). 
PGUSER="$postgresUser" PGPASSWORD="$postgresPwd" pg_restore -O -Fc -h $postgresServer -p $postgresPort -d "$postgresDbName" "$backupFile"

#echo 'Upgrading the database'
#$(dirname $0)/dbupgrade.sh -databaseName $postgresDbName -databaseType postgres -desiredVersion $targetSchemaVersion -host $postgresServer -user $postgresUser -password $postgresPwd -port $postgresPort -postgresInstalldir $postgresInstallDir -is64bit $is64bit -scriptsDir ../

# do the recommended maintenace
echo 'Doing VACUUM ANALYZE'
PGUSER="$postgresServiceUser" PGPASSWORD="$postgresServicePwd" psql -h $postgresServer -p $postgresPort -d "$postgresDbName" -c "vacuum analyze" 2>&1

echo 'Database restoration is done'
