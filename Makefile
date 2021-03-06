MAKEFLAGS = --no-builtin-rules --no-builtin-variables --always-make
.DEFAULT_GOAL := help

SHELL  = /usr/bin/env bash

alp:
	# aggregatesの引数には、まとめたいpathを指定する
	sudo alp -r --sum --limit=1000 -f $(file) --aggregates "/iine\S+,/photo\S+,/tag\S+,/article\S+,/member\S+,/update\S+,/profileupdate\S+"

restart:
	sh scripts/restart.sh

rotate:
	sh scripts/rotate_alplog.sh

set-slow-log:
	sudo mysql -uroot -e "set global slow_query_log = 1"
	sudo mysql -uroot -e "set global long_query_time = 0"
	sudo mysql -uroot -e "set global log_queries_not_using_indexes = 1"

mysqldumpslow:
	# slow logのファイル名はインスタンスによって変える
	sudo mysqldumpslow -s t /var/lib/mysql/${SLOW_LOG_FILE_NAME}.log > ~/tmp/slow.log
	sudo cp /dev/null /var/lib/mysql/${SLOW_LOG_FILE_NAME}.log

restart-mysql:
	sudo /etc/init.d/mysql restart

pprof:
	go tool pprof /home/isucon/isubata/webapp/go/src/isubata/  http://localhost:6060/debug/pprof/profile

syslog:
	sudo journalctl -e -u systemd.go.service

