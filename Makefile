FILE=${shell pwd}/script/tabelas.txt
DROP_TABLES=$(shell awk '{print "DROP TABLE " $$0 " CASCADE;\n"}' ${FILE} | paste -d" " -s -)
INSERTS=$(shell awk '{print "${shell pwd}/sql/insert-"$$0".sql"}' ${FILE} | paste -d" " -s -)
SCHEMA="public"

all: insert create drop delete

generate_faker:
	node script/insert.js usuario > sql/insert-usuario.sql
	node script/insert.js possui > sql/insert-possui.sql
	node script/insert.js paciente > sql/insert-paciente.sql

insert:
	echo "SET search_path TO ${SCHEMA};\n" > dist/insert.sql
	cat $(INSERTS) >> dist/insert.sql

create:
	echo "SET search_path TO ${SCHEMA};\n" > dist/create.sql
	cat sql/create.sql >> dist/create.sql

drop:
	echo "SET search_path TO ${SCHEMA};\n" > dist/drop.sql
	echo "$(DROP_TABLES)" >> dist/drop.sql

delete:
	echo "SET search_path TO ${SCHEMA};\n" > dist/delete.sql
	awk '{print "TRUNCATE "$$0" CASCADE;"}' $(FILE) >> dist/delete.sql
