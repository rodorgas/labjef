INSERT INTO exame(id_exame, tipo, virus)
  values
  (1,'PCR','Sars-CoV-2'),
  (2,'Sorologia','Sars-Cov-2'),
  (3,'Peniscopia','HPV'),
  (4,'Papanicolau','HPV'),
  (5,'PCR','H1N1');

ALTER SEQUENCE exame_id_exame_seq RESTART WITH 6;
