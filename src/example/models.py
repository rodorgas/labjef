from django.db import models
from django.core.exceptions import ValidationError


class Paciente(models.Model):
    pessoa = models.OneToOneField('Pessoa', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'paciente'

    def __str__(self):
        return f'{self.id} - {self.pessoa.nome}'


class Amostra(models.Model):
    paciente = models.ForeignKey('Paciente', models.DO_NOTHING)
    exame = models.ForeignKey('Exame', models.DO_NOTHING)
    codigo_amostra = models.CharField(max_length=255)
    metodo_de_coleta = models.CharField(max_length=255)
    material = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'amostra'
        constraints = [
            models.UniqueConstraint(
                fields=['paciente', 'exame', 'codigo_amostra'], name='unique_paciente_exame_codigo')
        ]


class Realiza(models.Model):
    paciente = models.ForeignKey('Paciente', models.DO_NOTHING)
    exame = models.ForeignKey('Exame', models.DO_NOTHING)
    codigo_amostra = models.CharField(max_length=255, blank=True, null=True)
    data_de_realizacao = models.DateTimeField(blank=True, null=True)
    data_de_solicitacao = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'realiza'
        constraints = [
            models.UniqueConstraint(
                fields=['paciente', 'exame', 'data_de_realizacao', 'data_de_solicitacao'], name='unique_key')
        ]


class Gerencia(models.Model):
    servico = models.ForeignKey('Servico', models.DO_NOTHING)
    exame = models.ForeignKey('Exame', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'gerencia'
        constraints = [models.UniqueConstraint(
            fields=['servico', 'exame'], name='unique_servico_exame')
        ]


class Pessoa(models.Model):
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
        return f'{self.id} - {self.nome}'


def valida_servico(value):
    if value not in ['visualização', 'inserção', 'alteração', 'remoção']:
        raise ValidationError(
            ('%(value)s não é um serviço válido'),
            params={'value': value})


class Servico(models.Model):
    nome = models.CharField(max_length=255)
    classe = models.CharField(max_length=255, validators=[valida_servico])

    class Meta:
        db_table = 'servico'
        constraints = [
            models.UniqueConstraint(
                fields=['nome', 'classe'], name='unique_nome_classe')
        ]

    def __str__(self):
        return str(self.id) + ' - ' + self.nome


class Perfil(models.Model):
    codigo = models.CharField(max_length=255)
    tipo = models.CharField(max_length=255)

    servicos = models.ManyToManyField(Servico, through='Pertence')

    class Meta:
        db_table = 'perfil'

    def __str__(self):
        return `{self.id} - {self.tipo}`


class Usuario(models.Model):
    pessoa = models.ForeignKey(Pessoa,
                               on_delete=models.PROTECT)
    area_de_pesquisa = models.CharField(max_length=255, blank=True, null=True)
    instituicao = models.CharField(max_length=255, blank=True, null=True)
    login = models.CharField(max_length=255)
    senha = models.CharField(max_length=255)
    tutor = models.ForeignKey(
        "self", on_delete=models.PROTECT, null=True, blank=True)
    # Esse campo não aparece nas tabelas do bd. Utilizado somente para compatibilidade com a criacao
    # de objetos
    perfis = models.ManyToManyField(
        Perfil, through='Possui')

    class Meta:
        db_table = 'usuario'
        constraints = [
            models.UniqueConstraint(fields=['pessoa'], name='unique_pessoa')
        ]

    def __str__(self):
        return str(self.id) + ' - ' + str(self.pessoa.nome)


# relacionamento Possui
class Possui(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    perfil = models.ForeignKey(Perfil, on_delete=models.CASCADE)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['usuario', 'perfil'], name='unique_possui')
        ]
        db_table = 'possui'

# Tutelamento


class Tutelamento(models.Model):
    usuario_tutelado = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    tutor = models.ForeignKey(
        Usuario, on_delete=models.PROTECT, related_name='+')
    servico = models.ForeignKey(Servico, on_delete=models.PROTECT)
    perfil = models.ForeignKey(Perfil, on_delete=models.PROTECT)
    data_de_inicio = models.DateField('data_de_inicio')
    data_de_termino = models.DateField('data_de_termino', null=True)

    class Meta:
        db_table = "tutelamento"
        constraints = [
            models.UniqueConstraint(
                fields=['usuario_tutelado', 'tutor', 'servico', 'perfil'], name='unique_tutelamento')
        ]


# Relacionamento Pertence
class Pertence(models.Model):
    servico = models.ForeignKey(Servico, on_delete=models.PROTECT)
    perfil = models.ForeignKey(Perfil, on_delete=models.PROTECT)

    class Meta:
        db_table = "pertence"
        constraints = [
            models.UniqueConstraint(
                fields=['servico', 'perfil'], name='unique_servico_perfil')
        ]


class Exame(models.Model):
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
    usuario = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    servico = models.ForeignKey(Servico, on_delete=models.PROTECT)
    exame = models.ForeignKey(Exame, on_delete=models.PROTECT)
    data_de_solicitacao = models.DateField(blank=True)

    class Meta:
        db_table = 'registra'
        constraints = [
            models.UniqueConstraint(
                fields=['usuario', 'servico', 'exame', 'data_de_solicitacao'], name='unique_registra'
            )
        ]

    def __str__(self):
        return str(self.id)+' - ' + str(self.data_de_solicitacao)
