import unittest
import urllib.request
import json

URL_PRODUTOS = "http://localhost:5001/produtos"
URL_PRODUTO = "http://localhost:5001/produto"

TAMANHO_DA_PAGINA = 4
NOME_DO_PRODUTO = "esportivo"

class TesteProdutos(unittest.TestCase):

    def acessar(self, url):
        resposta = urllib.request.urlopen(url)
        dados = resposta.read()
        return dados.decode("utf-8")
        
    def testar_01_lazy_loading(self):
        dados = self.acessar(f"{URL_PRODUTOS}/1/{TAMANHO_DA_PAGINA}")
        produtos = json.loads(dados)

        self.assertEqual(len(produtos), TAMANHO_DA_PAGINA)
        self.assertEqual(produtos[0]['produto_id'], 1)

    def testar_02_pesquisa_produto_pelo_id(self):
        dados = self.acessar(f"{URL_PRODUTO}/1")
        produto = json.loads(dados)

        self.assertEqual(produto['produto_id'], 1)

    def testar_03_pesquisa_produto_pelo_nome(self):
        dados = self.acessar(f"{URL_PRODUTOS}/1/{TAMANHO_DA_PAGINA}/{NOME_DO_PRODUTO}")
        produtos = json.loads(dados)

        for produto in produtos:
            self.assertIn(NOME_DO_PRODUTO, produto['nome_produto'].lower())