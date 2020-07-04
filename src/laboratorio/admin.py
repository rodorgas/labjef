from django.contrib.admin import AdminSite
from django.contrib import admin
from django.urls import path

from . import models
from .views import (dashboard)


class PerfilInline(admin.TabularInline):
    model = models.Possui
    extra = 1


class ServicoInline(admin.TabularInline):
    model = models.Pertence
    extra = 1


class TuteladoInline(admin.TabularInline):
    model = models.Tutelamento
    fk_name = 'tutor'
    extra = 1


class UsuarioAdmin(admin.ModelAdmin):
    inlines = (PerfilInline, TuteladoInline)
    list_display = ('nome', 'login', 'get_perfis',
                    'instituicao', 'area_de_pesquisa', 'get_tutor')

    def get_tutor(self, obj):
        """Nome do tutor"""
        if obj.tutor is not None:
            return obj.tutor.pessoa.nome
        return None

    def nome(self, obj):
        """Nome"""
        return obj.pessoa.nome

    def get_perfis(self, obj):
        """Perfis"""
        perfis = [x['tipo'] for x in obj.perfis.values()]

        return ', '.join(perfis)

    get_perfis.short_description = 'Perfis'
    get_tutor.short_description = 'Tutor'


class ServicoAdmin(admin.ModelAdmin):
    list_display = ('nome', 'classe')


class ExameAdmin(admin.ModelAdmin):
    list_display = ('tipo', 'virus')


class PerfilAdmin(admin.ModelAdmin):
    inlines = (ServicoInline,)
    list_display = ('codigo', 'tipo', 'get_servicos')

    def get_servicos(self, obj):
        """Perfis"""
        servicos = [x['nome'] for x in obj.servicos.values()]

        return ', '.join(servicos)

    get_servicos.short_description = 'Serviços'


class AmostraAdmin(admin.ModelAdmin):
    list_display = ('paciente', 'exame', 'codigo_amostra',
                    'metodo_de_coleta', 'material')


class PessoaAdmin(admin.ModelAdmin):
    list_display = ('cpf', 'nome', 'endereco', 'nascimento')


class RegistraAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'servico', 'exame', 'data_de_solicitacao')


class PacienteAdmin(admin.ModelAdmin):
    list_display = ('cpf', 'nome', 'endereco', 'nascimento')

    def cpf(self, obj):
        return obj.pessoa.cpf

    def nome(self, obj):
        return obj.pessoa.nome

    def endereco(self, obj):
        return obj.pessoa.endereco

    def nascimento(self, obj):
        return obj.pessoa.nascimento


class RealizaAdmin(admin.ModelAdmin):
    list_display = ('paciente', 'exame', 'codigo_amostra',
                    'data_de_realizacao', 'data_de_solicitacao')


class TutelamentoAdmin(admin.ModelAdmin):
    list_display = ('usuario_tutelado', 'tutor', 'servico',
                    'perfil', 'data_de_inicio', 'data_de_termino')


class MyAdminSite(AdminSite):
    index_template = 'laboratorio/index.html'
    app_index_template = 'laboratorio/app_index.html'

    def get_urls(self):
        urls = super().get_urls()
        urls += [
            path('laboratorio/dashboard/', self.admin_view(dashboard)),
        ]
        return urls


admin_site = MyAdminSite()

admin_site.register(models.Usuario, UsuarioAdmin)
admin_site.register(models.Pessoa, PessoaAdmin)
admin_site.register(models.Perfil, PerfilAdmin)
admin_site.register(models.Servico, ServicoAdmin)
admin_site.register(models.Exame, ExameAdmin)
admin_site.register(models.Registra, RegistraAdmin)
admin_site.register(models.Paciente, PacienteAdmin)
admin_site.register(models.Amostra, AmostraAdmin)
admin_site.register(models.Realiza, RealizaAdmin)
admin_site.register(models.Tutelamento, TutelamentoAdmin)
