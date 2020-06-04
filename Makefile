FILE=${shell pwd}/script/tabelas.txt
DROP_TABLES=$(shell paste -d, -s ${FILE})

all: insert create drop delete

generate_faker:
	node script/insert.js usuario > sql/insert-usuario.sql
	node script/insert.js possui > sql/insert-possui.sql
	node script/insert.js paciente > sql/insert-paciente.sql

insert:
	$(echo "cat $(awk '{print "sql/insert-"$0".sql"}' ./script/tabelas.txt | paste -d" " -s -)") > dist/insert.sql

create:
	cp sql/create.sql dist

drop:
	echo "DROP TABLE $(DROP_TABLES);" > dist/drop.sql

delete:
	awk '{print "DELETE FROM "$$0" CASCADE;"}' $(FILE) > dist/delete.sql
