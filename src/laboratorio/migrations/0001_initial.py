# Generated by Django 3.0.7 on 2020-06-03 14:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Perfil',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=255)),
                ('tipo', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cpf', models.CharField(max_length=11)),
                ('nome', models.CharField(max_length=255)),
                ('area_de_pesquisa', models.CharField(blank=True, max_length=255, null=True)),
                ('instituicao', models.CharField(blank=True, max_length=255, null=True)),
                ('data_de_nascimento', models.DateTimeField(verbose_name='data de nascimento')),
                ('login', models.CharField(max_length=255)),
                ('senha', models.CharField(max_length=255)),
                ('cpf_tutor', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='laboratorio.Usuario')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario_Possui_Perfil',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('perfil', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='laboratorio.Perfil')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='laboratorio.Usuario')),
            ],
        ),
        migrations.AddField(
            model_name='usuario',
            name='perfis',
            field=models.ManyToManyField(through='laboratorio.Usuario_Possui_Perfil', to='laboratorio.Perfil'),
        ),
    ]
