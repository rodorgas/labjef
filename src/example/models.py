from django.db import models
from django.core.exceptions import ValidationError


class Pessoa(models.Model):
    id_pessoa = models.AutoField(primary_key=True)
    cpf = models.CharField(max_length=255, unique=True)
    nome = models.CharField(max_length=255)
    endereco = models.CharField(max_length=255)
    nascimento = models.DateField('nascimento')

    class Meta:
        db_table = 'pessoa'
        constraints = [
            models.UniqueConstraint(fields=['cpf'], name='unique_cpf')
        ]

    def __str__(self):
        return str(self.id_pessoa) + ' ' + self.nome


def valida_servico(value):
    if value not in ['visualização', 'inserção', 'alteração', 'remoção']:
        raise ValidationError(
            ('%(value)s não é um serviço válido'),
            params={'value': value})


class Servico(models.Model):

    id_servico = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=255)
    classe = models.CharField(max_length=255, validators=[valida_servico])

    class Meta:
        db_table = 'servico'
        constraints = [
            models.UniqueConstraint(
                fields=['nome', 'classe'], name='unique_nome_classe')
        ]

    def __str__(self):
        return self.nome


class Perfil(models.Model):
    id_perfil = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=255)
    tipo = models.CharField(max_length=255)

    servicos = models.ManyToManyField(Servico, through='Pertence')

    def __str__(self):
        return self.codigo + ' ' + self.tipo

    class Meta:
        db_table = 'perfil'


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    cpf = models.ForeignKey(Pessoa, to_field='cpf',
                            db_column='cpf', on_delete=models.PROTECT)
    area_de_pesquisa = models.CharField(max_length=255, blank=True, null=True)
    instituicao = models.CharField(max_length=255, blank=True, null=True)
    login = models.CharField(max_length=255)
    senha = models.CharField(max_length=255)
    id_tutor = models.ForeignKey(
        "self", db_column='id_tutor', on_delete=models.PROTECT, null=True, blank=True)
    # Esse campo não aparece nas tabelas do bd. Utilizado somente para compatibilidade com a criacao
    # de objetos
    perfis = models.ManyToManyField(Perfil, through='Usuario_Possui_Perfil')

    class Meta:
        db_table = 'usuario'
        constraints = [
            models.UniqueConstraint(fields=['cpf'], name='unique_cpf_pessoa')
        ]

    def __str__(self):
        return str(self.id_usuario) + ' ' + self.cpf.nome


# relacionamento Possui
class Usuario_Possui_Perfil(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    perfil = models.ForeignKey(Perfil, on_delete=models.PROTECT)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['usuario', 'perfil'], name='unique_usuario_perfil')
        ]

# Tutelamento


class Tutelamento(models.Model):
    id_usuario_tutelado = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    id_tutor = models.ForeignKey(
        Usuario, on_delete=models.PROTECT, related_name='+')
    id_servico = models.ForeignKey(Servico, on_delete=models.PROTECT)
    id_perfil = models.ForeignKey(Perfil, on_delete=models.PROTECT)
    data_de_inicio = models.DateField('data_de_inicio')
    data_de_termino = models.DateField('data_de_termino', null=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['id_usuario_tutelado', 'id_tutor', 'id_servico', 'id_perfil'], name='unique_tutelamento')
        ]


# Relacionamento Pertence
class Pertence(models.Model):
    servico = models.ForeignKey(Servico, on_delete=models.PROTECT)
    perfil = models.ForeignKey(Perfil, on_delete=models.PROTECT)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['servico', 'perfil'], name='unique_servico_perfil')
        ]


class Exame(models.Model):
    id_exame = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255)
    virus = models.CharField(max_length=255)

    class Meta:
        db_table = 'exame'
        constraints = [
            models.UniqueConstraint(
                fields=['tipo', 'virus'], name='unique_tipo_virus')
        ]

    def __str__(self):
        return self.tipo + ' - ' + self.virus


class Registra(models.Model):
    id_usuario = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    id_servico = models.ForeignKey(Servico, on_delete=models.PROTECT)
    id_exame = models.ForeignKey(Exame, on_delete=models.PROTECT)
    data_de_solicitacao = models.DateField(blank=True)

    class Meta:
        db_table = 'registra'
        constraints = [
            models.UniqueConstraint(
                fields=['id_usuario', 'id_servico', 'id_exame', 'data_de_solicitacao'], name='unique_registra'
            )
        ]

    def __str__(self):
        return self.data_de_solicitacao
