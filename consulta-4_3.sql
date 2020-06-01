SELECT nome,classe
FROM servico
INNER JOIN tutelamento
      ON servico.id_servico=tutelamento.id_servico