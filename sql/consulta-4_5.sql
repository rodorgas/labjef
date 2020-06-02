-- Liste em ordem crescente o total de serviços utilizados
-- agrupados pelos tipos de serviços disponíveis e pelo
-- perfil dos usuários.
SELECT
    servico.nome,
    servico.classe,
    perfil.tipo as "Perfil",
    count(registra.id_servico) as "Quantidade"
FROM registra

INNER JOIN servico
    ON registra.id_servico = servico.id_servico

INNER JOIN usuario
    ON usuario.id_usuario = registra.id_usuario

INNER JOIN possui
    ON possui.id_usuario = usuario.id_usuario

INNER JOIN perfil
    ON perfil.id_perfil = possui.id_perfil

GROUP BY servico.id_servico, perfil.id_perfil

ORDER BY "Quantidade";
