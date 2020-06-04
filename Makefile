FILE=${shell pwd}/script/tabelas.txt
DROP_TABLES=$(shell paste -d, -s ${FILE})
INSERTS=$(shell awk '{print "${shell pwd}/sql/insert-"$$0".sql"}' ${FILE} | paste -d" " -s -)

all: insert create drop delete

generate_faker:
	node script/insert.js usuario > sql/insert-usuario.sql
	node script/insert.js possui > sql/insert-possui.sql
	node script/insert.js paciente > sql/insert-paciente.sql

insert:
	cat $(INSERTS) > dist/insert.sql

create:
	cp sql/create.sql dist

drop:
	echo "DROP TABLE $(DROP_TABLES);" > dist/drop.sql

delete:
	awk '{print "TRUNCATE "$$0" CASCADE;"}' $(FILE) > dist/delete.sql
