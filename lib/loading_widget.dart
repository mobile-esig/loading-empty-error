import 'dart:ui';

import 'package:flutter/material.dart';

import 'loading_indicator_type.dart';

class EsigLoadingWidget extends StatelessWidget {
  final String? ilustracaoAsset;
  final BoxConstraints? tamanhoIlustracao;
  final LoadingIndicator loadingIndicator;
  final EdgeInsets? paddingIndicator;
  final Color? colorIndicator;
  final String mensagem;
  final double? mensagemFontSize;

  const EsigLoadingWidget({
    Key? key,
    this.ilustracaoAsset,
    this.tamanhoIlustracao,
    this.loadingIndicator = LoadingIndicator.VAZIO,
    this.paddingIndicator,
    required this.mensagem,
    this.mensagemFontSize,
    this.colorIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ilustracaoAsset != null ? buildIlustracao() : Container(),
        loadingIndicator != LoadingIndicator.VAZIO
            ? buildLoadingIndicator()
            : Container(),
        buildMensagem(),
      ],
    );
  }

  Widget buildLoadingIndicator() => Padding(
        padding: paddingIndicator ?? EdgeInsets.all(8.0),
        child: loadingIndicator == LoadingIndicator.CIRCULAR
            ? CircularProgressIndicator()
            : LinearProgressIndicator(),
      );

  Text buildMensagem() => Text(
        mensagem,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: mensagemFontSize),
      );

  Container buildIlustracao() => Container(
        constraints: tamanhoIlustracao,
        child: Image.asset(
          ilustracaoAsset!,
          fit: BoxFit.contain,
        ),
      );
}
