import 'dart:ui';

import 'package:flutter/material.dart';

class EsigDialogWidget extends StatelessWidget {
  final Widget? icone;

  final String? titulo;
  final double? tamanhoTitulo;
  final String mensagem;
  final double? tamanhoMensagem;

  final void Function()? onTapPrincipal;
  final void Function()? onTapSecundario;
  final void Function()? onTapTerciario;

  final Axis? direcaoBotoes;

  const EsigDialogWidget({
    Key? key,
    this.icone,
    this.titulo,
    this.tamanhoTitulo,
    required this.mensagem,
    this.tamanhoMensagem,
    this.direcaoBotoes = Axis.horizontal,
    this.onTapPrincipal,
    this.onTapSecundario,
    this.onTapTerciario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          icone ?? Container(),
          titulo != null ? buildTitulo() : Container(),
          buildMensagem(),
          Flex(
            direction: Axis.horizontal,
            children: [],
          )
        ],
      ),
    );
  }

  Text buildMensagem() => Text(
        mensagem,
        style: TextStyle(fontSize: tamanhoMensagem),
      );

  Text buildTitulo() => Text(
        titulo!,
        style: TextStyle(
          color: Colors.black,
          fontSize: tamanhoTitulo,
          fontWeight: FontWeight.bold,
        ),
      );
}
