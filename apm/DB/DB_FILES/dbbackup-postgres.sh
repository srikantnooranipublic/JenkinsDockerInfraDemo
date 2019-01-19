#!/bin/sh
# runs the config import program

postgresServer=$1
postgresInstallDir=$2
postgresDbName=$3
postgresUser=$4
postgresPwd=$5
postgresPort=$6
dbBackupDir=$7
outputFile=$8

if [ $# -lt 6 ]; then
  echo "Required arguments <dbserverhostip> <dbinstalldir> <dbname> <dbuser> <dbpassword> <dbport> <dbbackupdir> <outputfile <optional>>"
  echo "dbinstalldir: complete path where the database is installed excluding the bin dir. "
  echo "eg: /opt/database/postgres/9.6-pgdg "
  exit
fi

if [ -z "$dbBackupDir" ]; then
  echo "No directory specified.  Defaulting to current directory."
  dbBackupDir=.
fi

if [ -z "$outputFile" ]; then
  outputFile=$postgresDbName.backup
fi

if [ -d "$dbBackupDir" ]; then
  echo ""
else
  echo "Directory '$dbBackupDir' where you want the backup file saved does not exist. Exiting..."
  exit
fi

if [ -x "$postgresInstallDir/bin/pg_dump" ]; then
  echo ""
elif [ -x "$postgresInstallDir/bin/64/pg_dump" ]; then
  echo ""
else  
  echo "'$postgresInstallDir' does not seem to point to a PostgreSQL installation. Exiting..."
  exit
fi

export PATH="$postgresInstallDir/bin:$postgresInstallDir/bin/64:$PATH"

# Confirm that the postgres version being used is one we support

# get version string which will be in the form of "PostgreSQL 9.2.4"
postgres_version_str=$(pg_dump --version)

# String all non numerics to capture version number
postgres_version=$(echo ${postgres_version_str//[^0-9]/})

if [ $postgres_version -lt 835 ]; then
	echo "$postgres_version_str is not supported.  Please upgrade to a newer version of CEM to get a newer PostgreSQL.  Exiting..."
	exit
fi

# run backup
PGUSER="$postgresUser" PGPASSWORD="$postgresPwd" pg_dump --verbose -Fc -C -h $postgresServer -p $postgresPort -f "$dbBackupDir/$outputFile" "$postgresDbName" 

fileName="$dbBackupDir/$outputFile"

if [ -e "$fileName" ]; then
  echo "Database backup is done."
else
  echo "The backup file was not created.  Check that the directory '$dbBackupDir' has write access."
  exit
fi


