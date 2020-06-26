from django.contrib import admin
from . import models


class PerfilInline(admin.TabularInline):
    model = models.Possui
    extra = 1


class ServicoInline(admin.TabularInline):
    model = models.Pertence
    extra = 1


class UsuarioAdmin(admin.ModelAdmin):
    inlines = (PerfilInline,)
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


admin.site.register(models.Usuario, UsuarioAdmin)
admin.site.register(models.Pessoa)
admin.site.register(models.Perfil, PerfilAdmin)
admin.site.register(models.Servico, ServicoAdmin)
admin.site.register(models.Exame, ExameAdmin)
admin.site.register(models.Registra)
admin.site.register(models.Paciente)
admin.site.register(models.Amostra)
admin.site.register(models.Realiza)
