import 'dart:ui';

import 'package:flutter/material.dart';

/// Widgets distinado aos casos nos quais ocorreu um erro interno no app e
/// alguma tarefa não pôde ser completada.
class EsigErrorWidget extends StatelessWidget {
  const EsigErrorWidget({
    Key? key,
    this.ilustracaoAsset,
    this.tamanhoIlustracao,
    this.titulo,
    this.tituloFontSize,
    this.tituloPadding,
    required this.mensagem,
    this.mensagemFontSize,
    this.mensagemPadding,
    this.onTryAgain,
    this.tryAgainBackgroundColor,
    this.tryAgainTextColor,
  }) : super(key: key);

  /// Caminho do asset declarado no [pubspec.yaml]. A imagem está configurada
  /// com [fit: BoxFit.contain].
  final String? ilustracaoAsset;

  /// Constraints máximos e mínimos da ilustração.
  final BoxConstraints? tamanhoIlustracao;

  /// Texto em negrito logo abaixo da ilustração e acima da [menssagem].
  final String? titulo;

  /// Tamanho do texto no título. Valor padrão é o mesmo do Flutter.
  final double? tituloFontSize;

  /// Padding em torno do título. Padrão é [EdgeInsets.all(8.0)].
  final EdgeInsets? tituloPadding;

  /// Mensagem explicando o motivo deste widget aparecer.
  final String mensagem;

  /// Tamanho da mensagem. Valor padrão é o mesmo do Flutter.
  final double? mensagemFontSize;

  /// Padding em torno da mensagem. Valor padrão é [EdgeInsets.all(8.0)]
  final EdgeInsets? mensagemPadding;

  /// Função chamada ao apertar botão TENTAR NOVAMENTE. O botão só é exibido se
  /// o parâmetro receber um valor.
  final void Function()? onTryAgain;

  /// cor no fundo do botão. Valor é atribuído ao
  /// [backgroundColor] do [ButtonStyle].
  final Color? tryAgainBackgroundColor;

  /// Cor do texto dentro do botão de TENTAR NOVAMENTE. Valor é atribuído ao
  /// [foregroundColor] do [ButtonStyle].
  final Color? tryAgainTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ilustracaoAsset != null ? buildIlustracao() : Container(),
        titulo != null ? buildTitulo() : Container(),
        buildMensagem(),
        onTryAgain != null ? botaoRefresh(context) : Container()
      ],
    );
  }

  ElevatedButton botaoRefresh(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(tryAgainBackgroundColor),
          foregroundColor: MaterialStateProperty.all(tryAgainTextColor),
        ),
        onPressed: onTryAgain,
        child: Text(
          'Tentar Novamente',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Padding buildMensagem() => Padding(
        padding:
            mensagemPadding != null ? mensagemPadding! : EdgeInsets.all(8.0),
        child: Text(
          mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: mensagemFontSize),
        ),
      );

  Padding buildTitulo() => Padding(
        padding: tituloPadding != null ? tituloPadding! : EdgeInsets.all(8.0),
        child: Text(
          titulo!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: tituloFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Container buildIlustracao() => Container(
        constraints: tamanhoIlustracao,
        child: Image.asset(
          ilustracaoAsset!,
          fit: BoxFit.contain,
        ),
      );
}
