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
            LIMIT 3
        """)

        return cursor.fetchall()


def eficiencia():
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT
                tipo,
                virus,
                avg(date_trunc(
                    'second', realiza.data_de_realizacao - realiza.data_de_solicitacao
                )) as espera_media
            FROM
                exame
            INNER JOIN realiza
                ON realiza.exame_id = exame.id
            GROUP BY
                tipo, virus
            ORDER BY
                espera_media
            LIMIT 5
            ;
        """)
        result = cursor.fetchall()

        return result


def usuarios_mais_ativos():
    with connection.cursor() as cursor:
        cursor.execute("""
        SELECT 
            pessoa.nome, 
            count(usuario.id) as "total" 
        FROM 
            registra 
        INNER JOIN usuario 
            ON usuario.id = registra.usuario_id 
        INNER JOIN pessoa 
            ON pessoa.id = usuario.pessoa_id 
        GROUP BY pessoa.nome 
        ORDER BY "total" DESC 
        LIMIT 5;
        """)
        result = cursor.fetchall()

        return result


def dashboard(request):
    dados = {}
    dados["virus"] = virus_mais_testados()
    dados["eficiente"] = eficiencia()
    dados["contadores"] = exame_numbers()
    dados["ativos"] = usuarios_mais_ativos()
    return render(request, 'laboratorio/dashboard.html', {"result": dados})
