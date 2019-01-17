if [ x"$1" == "xrestore" ]; then
	/opt/CA/Introscope/install/database-scripts/unix/dbbackup-postgres.sh 172.17.0.1 /var/lib/postgresql cemdb admin CAdemo123# 5432 /opt/CA/Introscope/config cemdbBck.data
fi

if [ x"$1" == "xbackup" ]; 
	/opt/CA/Introscope/install/database-scripts/unix/dbrestore-postgres.sh 172.17.0.1 /var/lib/postgresql postgres CAdemo123# cemdb admin CAdemo123# 5432 /opt/CA/Introscope/config/cemdbBck.data
fi
