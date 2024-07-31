from flask import Flask, jsonify
from urllib.request import urlopen
import mysql.connector as mysql
import json

servico = Flask("buildsdestiny")

SERVIDOR_BANCO = "banco"
USUARIO_BANCO = "root"
SENHA_BANCO = "admin"
NOME_BANCO = "banco"

def get_conexao_com_bd():
    conexao = mysql.connect(host=SERVIDOR_BANCO, user=USUARIO_BANCO, password=SENHA_BANCO, database=NOME_BANCO)

    return conexao


URL_LIKES = "http://likes:5000/likes_por_feed/"
def get_quantidade_de_curtidas(id_do_feed):
    url = URL_LIKES + str(id_do_feed)
    resposta = urlopen(url)
    resposta = resposta.read()
    resposta = json.loads(resposta)

    return resposta["curtidas"]

@servico.get("/info")
def get_info():
    return jsonify(
        descricao = "gerenciamento das builds do D2 Best Builds",
        versao = "1.0"
    )

@servico.get("/buildsdestiny/<int:ultimo_feed>/<int:tamanho_da_pagina>")
def get_buildsdestiny(ultimo_feed, tamanho_da_pagina):
    buildsDestiny = []

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
    "SELECT feeds.id AS buildDestiny_id, "
    "DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') AS data, "
    "feeds.popularity AS popularidade, "
    "classes.id AS class_id, "
    "classes.nome AS nome_class, "
    "classes.avatar, "
    "buildsDestiny.nome AS nome_buildDestiny, "
    "buildsDestiny.descricao, "
    "buildsDestiny.element AS elemento, "
    "buildsDestiny.url, "
    "buildsDestiny.imagem1, "
    "IFNULL(buildsDestiny.imagem2, '') AS imagem2, "
    "IFNULL(buildsDestiny.imagem3, '') AS imagem3 "
    "FROM feeds "
    "INNER JOIN buildsDestiny ON buildsDestiny.id = feeds.buildDestiny "
    "INNER JOIN classes ON classes.id = buildsDestiny.class "
    "WHERE feeds.id > %s "
    "ORDER BY buildDestiny_id ASC, data DESC "
    "LIMIT %s",
    (ultimo_feed, tamanho_da_pagina)
)

    buildsDestiny = cursor.fetchall()
    if buildsDestiny:
        for buildDestiny in buildsDestiny:
            buildDestiny["curtidas"] = get_quantidade_de_curtidas(buildDestiny['buildDestiny_id'])

    conexao.close()

    return jsonify(buildsDestiny)

@servico.get("/buildsdestiny/<int:ultimo_feed>/<int:tamanho_da_pagina>/<string:nome_da_build>")
def find_buildsDestiny(ultimo_feed, tamanho_da_pagina, nome_da_build):
    buildsDestiny = []

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "select feeds.id as buildDestiny_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "feeds.popularity AS popularidade, "
        "classes.id as class_id, classes.nome as nome_class, classes.avatar, buildsDestiny.nome as nome_buildDestiny, buildsDestiny.descricao, buildsDestiny.element as elemento, " +
        "buildsDestiny.url, buildsDestiny.imagem1, IFNULL(buildsDestiny.imagem2, '') as imagem2, IFNULL(buildsDestiny.imagem3, '') as imagem3 " +
        "FROM feeds, buildsDestiny, classes " +
        "WHERE buildsDestiny.id = feeds.buildDestiny " +
        "AND classes.id = buildsDestiny.class " +
        "AND buildsDestiny.nome LIKE '%" + nome_da_build + "%' "  +
        "AND feeds.id > " + str(ultimo_feed) + " ORDER BY buildDestiny_id ASC, data DESC " +
        "LIMIT " + str(tamanho_da_pagina)
    )
    buildsDestiny = cursor.fetchall()
    if buildsDestiny:
        for buildDestiny in buildsDestiny:
            buildDestiny["curtidas"] = get_quantidade_de_curtidas(buildDestiny['buildDestiny_id'])

    conexao.close()

    return jsonify(buildsDestiny)

@servico.get("/builddestiny/<int:feed>")
def find_buildDestiny(feed):
    buildDestiny = {}

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "select feeds.id as buildDestiny_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "feeds.popularity AS popularidade, "
        "classes.id as class_id, classes.nome as nome_class, classes.avatar, buildsDestiny.nome as nome_buildDestiny, buildsDestiny.descricao, buildsDestiny.element as elemento, " +
        "buildsDestiny.url, buildsDestiny.imagem1, IFNULL(buildsDestiny.imagem2, '') as imagem2, IFNULL(buildsDestiny.imagem3, '') as imagem3 " +
        "FROM feeds, buildsDestiny, classes " +
        "WHERE buildsDestiny.id = feeds.buildDestiny " +
        "AND classes.id = buildsDestiny.class " +
        "AND feeds.id = " + str(feed)
    )
    buildDestiny = cursor.fetchone()
    if buildDestiny:
        buildDestiny["curtidas"] = get_quantidade_de_curtidas(feed)

    conexao.close()

    return jsonify(buildDestiny)


if __name__ == "__main__":
    servico.run(host="0.0.0.0", debug=True)