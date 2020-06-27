from collections import namedtuple
from django.db import connection
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render
from .models import Usuario


def index():
    return HttpResponse("MAC0350/2020: Data Management Example")

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
    context = {'query2_result_list': result,}

    return HttpResponse(template.render(context, request))


#metodos auxiliares
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

    print(result)

    return render(request, 'example/sofisticado.html', {'result': result})
