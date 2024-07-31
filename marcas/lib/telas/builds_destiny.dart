// ignore_for_file: avoid_print, constant_identifier_names

import 'package:flat_list/flat_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marcas/apis/servicos.dart';
import 'package:marcas/autenticador.dart';
import 'package:marcas/componentes/card_build_destiny.dart';
import 'package:marcas/estado.dart';

class BuildsDestiny extends StatefulWidget {
  const BuildsDestiny({super.key});

  @override
  State<StatefulWidget> createState() => BuildsDestinyState();
}

const TAMANHO_DA_PAGINA = 4;

class BuildsDestinyState extends State<BuildsDestiny> {
  List<dynamic> _buildsDestiny = [];

  String _filtro = "";
  late TextEditingController _controladorFiltro;

  bool _carregando = false;
  int _ultimoBuildDestiny = 0;

  late ServicoBuildsDestiny _servicoBuildsDestiny;

  @override
  void initState() {
    _controladorFiltro = TextEditingController();
    _recuperarUsuarioLogado();

    _servicoBuildsDestiny = ServicoBuildsDestiny();
    _carregarBuildsDestiny();

    super.initState();
  }

  void _recuperarUsuarioLogado() {
    Autenticador.recuperarUsuario().then((usuario) {
      if (usuario != null) {
        setState(() {
          estadoApp.onLogin(usuario);
        });
      }
    });
  }

  void _carregarBuildsDestiny() {
    setState(() {
      _carregando = true;
    });

    if (_filtro.isNotEmpty) {
      _servicoBuildsDestiny
          .findBuildsDestiny(_ultimoBuildDestiny, TAMANHO_DA_PAGINA, _filtro)
          .then((buildsDestiny) {
        setState(() {
          _carregando = false;
          _ultimoBuildDestiny = buildsDestiny.isNotEmpty
              ? buildsDestiny.last["buildDestiny_id"]
              : _ultimoBuildDestiny;

          _buildsDestiny.addAll(buildsDestiny);
        });
      });
    } else {
      _servicoBuildsDestiny
          .getBuildsDestiny(_ultimoBuildDestiny, TAMANHO_DA_PAGINA)
          .then((buildsDestiny) {
        setState(() {
          _carregando = false;
          _ultimoBuildDestiny = buildsDestiny.isNotEmpty
              ? buildsDestiny.last["buildDestiny_id"]
              : _ultimoBuildDestiny;

          _buildsDestiny.addAll(buildsDestiny);
        });
      });
    }
  }

  Future<void> _atualizarBuildsDestiny() async {
    _buildsDestiny = [];
    _ultimoBuildDestiny = 0;

    _carregarBuildsDestiny();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const SizedBox.shrink(),
          actions: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  controller: _controladorFiltro,
                  // usar onChanged quando a filtragem jah ocorrer enquanto o
                  // usuario digitas
                  // onChanged: (texto) {
                  //   _filtro = texto;
                  // },
                  // usar onSubmitted quando a filtragem tiver que ocorrer
                  // depois do usuario digitar e confirmar
                  onSubmitted: (texto) {
                    _filtro = texto;

                    _atualizarBuildsDestiny();
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search))),
            )),
            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: estadoApp.temUsuarioLogado()
                    ? GestureDetector(
                        onTap: () {
                          Autenticador.logout().then((_) {
                            Fluttertoast.showToast(
                                msg: "você não está mais conectado");

                            setState(() {
                              estadoApp.onLogout();
                            });
                          });
                        },
                        child: const Icon(Icons.logout, size: 30))
                    : GestureDetector(
                        onTap: () {
                          Autenticador.login().then((usuario) {
                            Fluttertoast.showToast(
                                msg: "você foi conectado com sucesso");

                            setState(() {
                              estadoApp.onLogin(usuario);
                            });
                          });
                        },
                        child: const Icon(Icons.person, size: 30)))
          ],
        ),
        body: FlatList(
          data: _buildsDestiny,
          loading: _carregando,
          numColumns: 2,
          onRefresh: () {
            _filtro = "";
            _controladorFiltro.clear();

            return _atualizarBuildsDestiny();
          },
          onEndReached: () {
            _carregarBuildsDestiny();
          },
          onEndReachedDelta: 200,
          buildItem: (item, int index) {
            print(item);

            return CardBuildDestiny(item);
          },
          // listEmptyWidget: Container(
          //     alignment: Alignment.center,
          //     child: const Text("Não existem buildsDestiny para exibir :(")),
        ));
  }
}
