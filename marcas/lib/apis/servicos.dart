// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:marcas/autenticador.dart';

final URL_SERVICOS = Uri.parse("http://10.0.2.2");

final URL_BUILDSDESTINY = "${URL_SERVICOS.toString()}:5001/buildsdestiny";
final URL_BUILDDESTINY = "${URL_SERVICOS.toString()}:5001/builddestiny";

final URL_COMENTARIOS = "${URL_SERVICOS.toString()}:5002/comentarios";
final URL_ADICIONAR_COMENTARIO = "${URL_SERVICOS.toString()}:5002/adicionar";
final URL_REMOVER_COMENTARIO = "${URL_SERVICOS.toString()}:5002/remover";

final URL_CURTIU = "${URL_SERVICOS.toString()}:5003/curtiu";
final URL_CURTIR = "${URL_SERVICOS.toString()}:5003/curtir";
final URL_DESCURTIR = "${URL_SERVICOS.toString()}:5003/descurtir";

final URL_ARQUIVOS = "${URL_SERVICOS.toString()}:5005";

class ServicoBuildsDestiny {
  Future<List<dynamic>> getBuildsDestiny(
      int ultimoBuildDestiny, int tamanhoPagina) async {
    final resposta = await http.get(Uri.parse(
        "${URL_BUILDSDESTINY.toString()}/$ultimoBuildDestiny/$tamanhoPagina"));
    final buildsDestiny = jsonDecode(resposta.body);

    return buildsDestiny;
  }

  Future<List<dynamic>> findBuildsDestiny(
      int ultimoBuildDestiny, int tamanhoPagina, String nome) async {
    final resposta = await http.get(Uri.parse(
        "${URL_BUILDSDESTINY.toString()}/$ultimoBuildDestiny/$tamanhoPagina/$nome"));
    final buildsDestiny = jsonDecode(resposta.body);

    return buildsDestiny;
  }

  Future<Map<String, dynamic>> findBuildDestiny(int idBuildDestiny) async {
    final resposta = await http
        .get(Uri.parse("${URL_BUILDDESTINY.toString()}/$idBuildDestiny"));
    final buildsDestiny = jsonDecode(resposta.body);

    return buildsDestiny;
  }
}

class ServicoCurtidas {
  Future<bool> curtiu(Usuario usuario, int idBuildDestiny) async {
    final resposta = await http.get(
        Uri.parse("${URL_CURTIU.toString()}/${usuario.email}/$idBuildDestiny"));
    final resultado = jsonDecode(resposta.body);

    return resultado["curtiu"] as bool;
  }

  Future<dynamic> curtir(Usuario usuario, int idBuildDestiny) async {
    final resposta = await http.post(
        Uri.parse("${URL_CURTIR.toString()}/${usuario.email}/$idBuildDestiny"));

    return jsonDecode(resposta.body);
  }

  Future<dynamic> descurtir(Usuario usuario, int idBuildDestiny) async {
    final resposta = await http.post(Uri.parse(
        "${URL_DESCURTIR.toString()}/${usuario.email}/$idBuildDestiny"));

    return jsonDecode(resposta.body);
  }
}

class ServicoComentarios {
  Future<List<dynamic>> getComentarios(
      int idBuildDestiny, int pagina, int tamanhoPagina) async {
    final resposta = await http.get(Uri.parse(
        "${URL_COMENTARIOS.toString()}/$idBuildDestiny/$pagina/$tamanhoPagina"));
    final comentarios = jsonDecode(resposta.body);

    return comentarios;
  }

  Future<dynamic> adicionar(
      int idBuildDestiny, Usuario usuario, String comentario) async {
    final resposta = await http.post(Uri.parse(
        "${URL_ADICIONAR_COMENTARIO.toString()}/$idBuildDestiny/${usuario.nome}/${usuario.email}/$comentario"));

    return jsonDecode(resposta.body);
  }

  Future<dynamic> remover(int idComentario) async {
    final resposta = await http.delete(
        Uri.parse("${URL_REMOVER_COMENTARIO.toString()}/$idComentario"));

    return jsonDecode(resposta.body);
  }
}

String caminhoArquivo(String arquivo) {
  return "${URL_ARQUIVOS.toString()}/$arquivo";
}
