if [ x"$1" == "xbackup" ]; then
	/usr/local/bin/dbbackup-postgres.sh localhost /usr/local/ cemdb admin CAdemo123# 5432 /var/lib/postgresql/data/ cemdbBck.data
fi

if [ x"$1" == "xrestore" ]; then
	/usr/local/bin/dbrestore-postgres.sh localhost /usr/local postgres CAdemo123# cemdb admin CAdemo123# 5432 /var/lib/postgresql/data/cemdbBck.data
fi
