import 'dart:ui';

import 'package:flutter/material.dart';

import 'botao_dialog.dart';

/// Dialog destinado a apresentar instruções, e possivelmente opções, ao usuário.
class EsigDialogWidget extends StatelessWidget {
  /// TODO(victor): testar se valores são válidos.
  /// Caso o 'onPressed' de um botão é diferente de nulo, o texto correspondente
  /// deve ser também não nulo.
  EsigDialogWidget({
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

  /// Ícone em cima do título
  final Widget? icone;

  /// Texto principal, exibido em negrito abaixo do ícone
  final String? titulo;

  /// Tamanho do título, valor padrão é o mesmo do Flutter
  final double? tamanhoTitulo;

  /// Paddging em torno do título
  final EdgeInsets? paddingTitulo;

  /// Texto secundário, exibido abaixo do título
  final String mensagem;

  /// Tamanho do texto secundário
  final double? tamanhoMensagem;

  /// Função executada ao pressionar o [TextButton] principal. Se nenhum valor
  /// for fornecido, o botão não será exibido.
  final void Function()? onPressedPrincipal;

  /// Texto dentro do botão principal
  final Text? textoPrincipal;

  /// Função executada ao pressionar o [TextButton] secundário. Se nenhum valor
  /// for fornecido, o botão não será exibido. Este botão aparece ao lado
  /// esquerdo ou abaixo do principal, dependendo da orientação escolhida em
  /// [direcaoBotoes]
  final void Function()? onPressedSecundario;

  /// Texto dentro do botão secundário
  final Text? textoSecundario;

  /// Função executada ao pressionar o [TextButton] terciário. Se nenhum valor
  /// for fornecido, o botão não será exibido. Este botão aparece ao lado
  /// esquerdo ou abaixo do secundário, dependendo da orientação escolhida em
  /// [direcaoBotoes]
  final void Function()? onPressedTerciario;

  /// Texto dentro do botão terciário
  final Text? textoTerciario;

  /// Direção dos botões dentro do [Dialog]. Para opções mais verbosas
  /// recomenda-se usar os botões na vertical. Para opções com apenas uma
  /// palavra, pode-se usar os botões na horizontal.
  final Axis? direcaoBotoes;

  @override
  Widget build(BuildContext context) {
    final textoPadrao = Text('OK');
    final double alturaBotao = 40;
    final Widget divider = direcaoBotoes == Axis.vertical
        ? Divider(height: 1)
        : VerticalDivider(width: 1);

    List<Widget> botoes = [
      if (onPressedPrincipal != null)
        EsigTextButton(
          texto: textoPrincipal ?? textoPadrao,
          onPressed: onPressedPrincipal,
        ),
      if (onPressedSecundario != null) divider,
      if (onPressedSecundario != null)
        EsigTextButton(
          texto: textoSecundario ?? textoPadrao,
          onPressed: onPressedSecundario,
        ),
      if (onPressedTerciario != null) divider,
      if (onPressedTerciario != null)
        EsigTextButton(
          texto: textoTerciario ?? textoPadrao,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
