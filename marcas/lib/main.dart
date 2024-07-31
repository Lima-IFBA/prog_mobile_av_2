import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marcas/estado.dart';
import 'package:provider/provider.dart';

import 'telas/detalhes.dart';
import 'telas/builds_destiny.dart';

void main() {
  runApp(const DTwoBestBuilds());
}

class DTwoBestBuilds extends StatelessWidget {
  const DTwoBestBuilds({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => EstadoApp(),
        child: MaterialApp(
          title: 'D2 Best Builds',
          theme: ThemeData(
            colorScheme: const ColorScheme.light(),
            useMaterial3: true,
          ),
          home: const TelaPrincipal(),
        ));
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  void _exibirComoRetrato() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    _exibirComoRetrato();

    estadoApp = context.watch<EstadoApp>();
    Widget tela = const SizedBox.shrink();
    if (estadoApp.situacao == Situacao.mostrandoBuildsDestiny) {
      tela = const BuildsDestiny();
    } else if (estadoApp.situacao == Situacao.mostrandoDetalhes) {
      tela = const Detalhes();
    }

    return tela;
  }
}
