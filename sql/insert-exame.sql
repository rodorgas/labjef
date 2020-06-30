INSERT INTO exame(id, tipo, virus)
  values
  (1,'PCR','Sars-CoV-2'),
  (2,'Sorologia','Sars-CoV-2'),
  (3,'Peniscopia','HPV'),
  (4,'Papanicolau','HPV'),
  (5,'PCR','H1N1');

ALTER SEQUENCE exame_id_seq RESTART WITH 6;
