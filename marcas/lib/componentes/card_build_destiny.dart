// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:marcas/apis/servicos.dart';
import 'package:marcas/estado.dart';

class CardBuildDestiny extends StatefulWidget {
  final dynamic buildDestiny;

  const CardBuildDestiny(this.buildDestiny, {super.key});

  @override
  State<StatefulWidget> createState() {
    return CardBuildDestinyState();
  }
}

class CardBuildDestinyState extends State<CardBuildDestiny> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 340,
        child: GestureDetector(
            onTap: () {
              estadoApp.mostrarDetalhes(widget.buildDestiny["buildDestiny_id"]);
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: Image.network(
                          caminhoArquivo(widget.buildDestiny["imagem1"]))),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.network(
                          caminhoArquivo(widget.buildDestiny["avatar"]),
                          width: 34,
                        ),
                        const SizedBox(
                            width:
                                5), // Ajuste o espaço entre a imagem e o texto
                        Expanded(
                          child: Text(
                            widget.buildDestiny["nome_buildDestiny"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 5, bottom: 10),
                    child: Text(
                      widget.buildDestiny["descricao"],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Popularidade: ${widget.buildDestiny["popularidade"]}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                            size: 18,
                          ),
                          Text(
                            widget.buildDestiny["curtidas"].toString(),
                          ),
                        ],
                      ),
                    )
                  ])
                ],
              ),
            )));
  }
}
