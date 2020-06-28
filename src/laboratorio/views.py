from collections import namedtuple
from django.db import connection
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render, redirect
from .models import Usuario


def index(request):
    return redirect('/admin')


def query1(request):
    template = loader.get_template('laboratorio/query1.html')
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
    template = loader.get_template('laboratorio/query2.html')
    context = {'query2_result_list': result, }

    return HttpResponse(template.render(context, request))


# metodos auxiliares
def named_tuple_fetchall(cursor):
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    result = [nt_result(*row) for row in cursor.fetchall()]

    return result


def exames_solicitados(cursor):
    cursor.execute("""
        select count(registra.id)
        from registra
        inner join servico
        on registra.servico_id = servico.id
        where servico_id = 2
        ;
    """)
    return cursor.fetchall()


def exames_visualizados(cursor):
    cursor.execute("""
        select count(registra.id)
        from registra
        inner join servico
        on registra.servico_id = servico.id
        where servico_id = 3 or servico_id = 5
        ;

    """)
    return cursor.fetchall()


def exames_alterados(cursor):
    cursor.execute("""
        select count(registra.id)
        from registra
        inner join servico
        on registra.servico_id = servico.id
        where servico_id = 1
        ;
    """)
    return cursor.fetchall()


def exames_removidos(cursor):
    cursor.execute("""
        select count(registra.id)
        from registra
        inner join servico
        on registra.servico_id = servico.id
        where servico_id = 4
        ;
    """)
    return cursor.fetchall()


def exame_numbers():
    results = {}
    cursor = connection.cursor()
    results["solicitados"] = exames_solicitados(cursor)
    results["visualizados"] = exames_visualizados(cursor)
    results["alterados"] = exames_alterados(cursor)
    results["removidos"] = exames_removidos(cursor)

    return results


def virus_mais_testados():
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT 
                virus, 
                count(realiza.id) as "Quantidade"
            FROM 
                exame
            INNER JOIN realiza
                ON realiza.exame_id = exame.id
            GROUP BY virus
            ORDER BY "Quantidade" DESC

        """)

    return cursor.fetchall()


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

    return result


def exames_pendentes():
    with connection.cursor() as cursor:
        cursor.execute("""
        SELECT 
            realiza.codigo_amostra, 
            tipo, 
            virus, 
            date_trunc('day', now() - realiza.data_de_solicitacao) as "espera"
        FROM 
            realiza
        INNER JOIN exame 
            ON exame.id = realiza.exame_id
        INNER JOIN amostra
            ON amostra.codigo_amostra = realiza.codigo_amostra
        WHERE 
            realiza.data_de_realizacao IS NULL
        """)
        result = cursor.fetchall()

    return result
