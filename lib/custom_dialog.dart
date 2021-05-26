import 'dart:ui';

import 'package:flutter/material.dart';

import 'botao_dialog.dart';

class EsigDialogWidget extends StatelessWidget {
  final Widget? icone;

  final String? titulo;
  final double? tamanhoTitulo;
  final EdgeInsets? paddingTitulo;

  final String mensagem;
  final double? tamanhoMensagem;

  final void Function()? onPressedPrincipal;
  final String? textoPrincipal;

  final void Function()? onPressedSecundario;
  final String? textoSecundario;

  final void Function()? onPressedTerciario;
  final String? textoTerciario;

  final Axis? direcaoBotoes;

  const EsigDialogWidget({
    Key? key,
    this.icone,
    this.titulo,
    this.tamanhoTitulo,
    required this.mensagem,
    this.tamanhoMensagem,
    this.direcaoBotoes = Axis.horizontal,
    this.onPressedPrincipal,
    this.onPressedSecundario,
    this.onPressedTerciario,
    this.textoPrincipal,
    this.textoSecundario,
    this.textoTerciario,
    this.paddingTitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double alturaBotao = 40;
    final Widget divider = direcaoBotoes == Axis.vertical
        ? Divider(height: 1)
        : VerticalDivider(width: 1);

    List<Widget> botoes = [
      if (onPressedPrincipal != null)
        EsigTextButton(
          texto: textoPrincipal ?? 'OK',
          onPressed: onPressedPrincipal,
        ),
      if (onPressedSecundario != null) divider,
      if (onPressedSecundario != null)
        EsigTextButton(
          texto: textoSecundario ?? 'OK',
          onPressed: onPressedSecundario,
        ),
      if (onPressedTerciario != null) divider,
      if (onPressedTerciario != null)
        EsigTextButton(
          texto: textoTerciario ?? 'OK',
          onPressed: onPressedTerciario,
        )
    ];

    final double alturaBotoes = direcaoBotoes == Axis.vertical
        ? botoes.whereType<EsigTextButton>().length * alturaBotao
        : alturaBotao;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                icone ?? Container(),
                titulo != null ? buildTitulo() : Container(),
                buildMensagem(),
              ],
            ),
          ),
          Divider(height: 1),
          Container(
            height: alturaBotoes,
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: direcaoBotoes ?? Axis.horizontal,
              children: botoes
                  .map(
                    (b) => b is EsigTextButton ? Expanded(child: b) : b,
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Text buildMensagem() => Text(
        mensagem,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: tamanhoMensagem,
          color: Colors.grey[600],
        ),
      );

  Widget buildTitulo() => Padding(
        padding: paddingTitulo ?? EdgeInsets.symmetric(vertical: 10),
        child: Text(
          titulo!.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: tamanhoTitulo,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
