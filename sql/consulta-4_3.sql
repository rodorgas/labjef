SELECT DISTINCT servico.nome,servico.classe
FROM servico
INNER JOIN pertence
      ON servico.id_servico=pertence.id_servico
INNER JOIN perfil
      ON pertence.id_perfil=perfil.id_perfil
INNER JOIN possui
      ON perfil.id_perfil = possui.id_perfil
INNER JOIN usuario
      ON possui.id_usuario = usuario.id_usuario