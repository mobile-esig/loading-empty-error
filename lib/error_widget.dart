import 'dart:ui';

import 'package:flutter/material.dart';

///
class EsigErrorWidget extends StatelessWidget {
  final String? ilustracaoAsset;
  final BoxConstraints? tamanhoIlustracao;
  final String? titulo;
  final double? tituloFontSize;
  final EdgeInsets? tituloPadding;
  final String mensagem;
  final double? mensagemFontSize;
  final EdgeInsets? mensagemPadding;
  final void Function()? onTryAgain;
  final Color? tryAgainBackgroundColor;
  final Color? tryAgainTextColor;

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
