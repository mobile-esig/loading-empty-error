import 'dart:ui';

import 'package:flutter/material.dart';

import 'loading_indicator_type.dart';

/// Widget apresentado durante o processamento de alguma tarefa realziada pelo
/// app. Indica ao usuário que ele deve esperar a finalização de algo.
class EsigLoadingWidget extends StatelessWidget {
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

  /// Caminho do asset declarado no [pubspec.yaml]. A imagem está configurada
  /// com [fit: BoxFit.contain].
  final String? ilustracaoAsset;

  /// Constraints máximos e mínimos da ilustração.
  final BoxConstraints? tamanhoIlustracao;

  /// Tipo do indicador de progresso padrão do Flutter a ser exibido. Opções
  /// estão disponíveis em [loading_indicator_type.dart] e são [VAZIO], [LINEAR],
  /// e [CIRCULAR]. Valor padrão é [VAZIO].
  final LoadingIndicator loadingIndicator;

  final EdgeInsets? paddingIndicator;

  /// Cor no indicador de progresso.
  final Color? colorIndicator;

  /// Mensagem explicando o motivo deste widget aparecer.
  final String mensagem;

  /// Tamanho da mensagem. Valor padrão é o mesmo do Flutter.
  final double? mensagemFontSize;

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
