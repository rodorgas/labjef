from collections import namedtuple
from django.db import connection
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect
from .models import Usuario


def index(request):
    return redirect('/admin')


def query1(request):
    template = loader.get_template('example/query1.html')
    context = {'query1_result_list': Usuario.objects.all()}

    return HttpResponse(template.render(context, request))


def query2(request):
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT u.login, string_agg(p.tipo, \', \') as perfis FROM usuario as u
            LEFT JOIN possui
            ON u.id = possui.usuario_id
            JOIN perfil as p
            ON possui.perfil_id = p.id
            GROUP BY u.login
        """)
        result = named_tuple_fetchall(cursor)
    print(result)
    template = loader.get_template('example/query2.html')
    context = {'query2_result_list': result, }

    return HttpResponse(template.render(context, request))


# metodos auxiliares
def named_tuple_fetchall(cursor):
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    result = [nt_result(*row) for row in cursor.fetchall()]

    return result


def sofisticado(request):
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT
                pessoa.nome,
                exame.tipo,
                exame.virus,
                realiza.data_de_solicitacao,
                realiza.data_de_realizacao
            FROM
                realiza
            INNER JOIN exame
                ON realiza.exame_id = exame.id
            INNER JOIN paciente
                ON realiza.paciente_id = paciente.id
            INNER JOIN pessoa
                ON paciente.pessoa_id = pessoa.id
            ;
        """)
        result = cursor.fetchall()

    return render(request, 'example/sofisticado.html', {'result': result})


def eficiencia(request):
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT
                tipo,
                virus, 
                realiza.data_de_realizacao - realiza.data_de_solicitacao as "Tempo de espera"
            FROM
                exame
            INNER JOIN realiza
                ON realiza.exame_id = exame.id
            ORDER BY "Tempo de espera"
            LIMIT 5
            ;
        """)
        result = cursor.fetchall()

    return render(request, 'example/eficiencia.html', {'result': result})


def servicoUsuario(request):
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT DISTINCT 
                servico.nome, 
                servico.classe
            FROM servico
            INNER JOIN pertence
                ON servico.id_servico=pertence.id_servico
            INNER JOIN perfil
                ON pertence.id_perfil=perfil.id_perfil
            INNER JOIN possui
                ON perfil.id_perfil = possui.id_perfil
            INNER JOIN usuario
                ON possui.id_usuario = usuario.id_usuario
            ;
        """)
        result = cursor.fetchall()

    return render(request, 'example/servicoUsuario.html', {'result': result})


def servicoTutelado(request):
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT DISTINCT 
                nome, 
                classe
            FROM servico
            INNER JOIN tutelamento
                ON servico.id_servico=tutelamento.id_servico
            ;
        """)
        result = cursor.fetchall()

    return render(request, 'example/servicoTutelado.html', {'result': result})


def agrupado(request):
    with connection.cursor() as cursor:
        cursor.execute("""
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
        """)
        result = cursor.fetchall()

    return render(request, 'example/agrupado.html', {'result': result})
