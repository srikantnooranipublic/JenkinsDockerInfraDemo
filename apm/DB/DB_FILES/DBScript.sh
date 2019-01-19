if [ x"$1" == "xbackup" ]; then
	/usr/local/bin/dbbackup-postgres.sh 172.17.0.1 /usr/local/ cemdb admin CAdemo123# 5444 /CEM_DB cemdbBck.data
fi

if [ x"$1" == "xrestore" ]; then
	/usr/local/bin/dbrestore-postgres.sh 172.17.0.1 /usr/local postgres CAdemo123# cemdb admin CAdemo123# 5444 /CEM_DB/cemdbBck.data
fi
