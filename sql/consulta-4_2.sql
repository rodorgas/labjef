SELECt tipo,virus, realiza.data_de_realizacao - realiza.data_de_solicitacao as "Tempo de espera"
FROM exame
INNER JOIN realiza
      ON realiza.id_exame = exame.id_exame
ORDER BY "Tempo de espera"
LIMIT 5
