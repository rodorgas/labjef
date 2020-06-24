from django.contrib import admin
from . import models


class PerfilInline(admin.TabularInline):
    model = models.Possui
    extra = 1


class UsuarioAdmin(admin.ModelAdmin):
    inlines = (PerfilInline,)
    list_display = ('nome', 'login', 'get_perfis')

    def nome(self, obj):
        """Nome"""
        return obj.pessoa.nome

    def get_perfis(self, obj):
        """Perfis"""
        perfis = [x['tipo'] for x in obj.perfis.values()]

        return ', '.join(perfis)

    get_perfis.short_description = 'Perfis'


admin.site.register(models.Usuario, UsuarioAdmin)
admin.site.register(models.Pessoa)
admin.site.register(models.Perfil)
admin.site.register(models.Servico)
admin.site.register(models.Exame)
admin.site.register(models.Registra)
admin.site.register(models.Paciente)
admin.site.register(models.Amostra)
admin.site.register(models.Realiza)
