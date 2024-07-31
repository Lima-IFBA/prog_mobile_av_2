// ignore_for_file: unnecessary_getters_setters
import 'package:flutter/material.dart';

import 'autenticador.dart';

enum Situacao { mostrandoBuildsDestiny, mostrandoDetalhes }

class EstadoApp extends ChangeNotifier {
  Situacao _situacao = Situacao.mostrandoBuildsDestiny;
  Situacao get situacao => _situacao;
  set situacao(Situacao situacao) {
    _situacao = situacao;
  }

  int _idBuildDestiny = 0;
  int get idBuildDestiny => _idBuildDestiny;
  set idBuildDestiny(int idBuildDestiny) {
    _idBuildDestiny = idBuildDestiny;
  }

  Usuario? _usuario;
  Usuario? get usuario => _usuario;
  set usuario(Usuario? usuario) {
    _usuario = usuario;
  }

  void mostrarBuildsDestiny() {
    situacao = Situacao.mostrandoBuildsDestiny;

    notifyListeners();
  }

  void mostrarDetalhes(int idBuildDestiny) {
    situacao = Situacao.mostrandoDetalhes;
    this.idBuildDestiny = idBuildDestiny;

    notifyListeners();
  }

  void onLogin(Usuario usuario) {
    _usuario = usuario;

    notifyListeners();
  }

  void onLogout() {
    _usuario = null;

    notifyListeners();
  }

  bool temUsuarioLogado() {
    return _usuario != null;
  }
}

late EstadoApp estadoApp;
