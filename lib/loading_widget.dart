import 'package:flutter/material.dart';

import 'loading_indicator_type.dart';

/// Widget apresentado durante o processamento de alguma tarefa realziada pelo
/// app. Indica ao usuário que ele deve esperar a finalização de algo.
class EsigLoadingWidget extends StatelessWidget {
  const EsigLoadingWidget(
    this.mensagem, {
    Key? key,
    this.ilustracaoAsset,
    this.tamanhoIlustracao,
    this.loadingIndicator = LoadingIndicator.VAZIO,
    this.paddingIndicator,
    this.paddingIlustracao,
    this.mensagemFontSize,
    this.colorIndicator,
    this.altura,
    this.largura,
    this.corMensagem,
  }) : super(key: key);

  /// Caminho do asset declarado no [pubspec.yaml]. A imagem está configurada
  /// com [fit: BoxFit.contain].
  final String? ilustracaoAsset;

  /// Constraints máximos e mínimos da ilustração.
  final BoxConstraints? tamanhoIlustracao;

  /// Padding aplicado à ilustração. Valor padrão é [EdgeInsets.all(8.0)]
  final EdgeInsets? paddingIlustracao;

  /// Tipo do indicador de progresso padrão do Flutter a ser exibido. Opções
  /// estão disponíveis em [loading_indicator_type.dart] e são [VAZIO], [LINEAR],
  /// e [CIRCULAR].
  final LoadingIndicator loadingIndicator;

  /// Padding aplicado ao indicador de carregamento. Valor padrão é
  /// [EdgeInsets.all(8.0)]
  final EdgeInsets? paddingIndicator;

  /// Cor no indicador de progresso.
  final Color? colorIndicator;

  /// Mensagem explicando o motivo deste widget aparecer.
  final String mensagem;

  /// Cor do texto na mensagem
  final Color? corMensagem;

  /// Tamanho da mensagem.
  final double? mensagemFontSize;

  /// Altura total do widget. Parâmetro serve para evitar usar o código abaixo
  /// toda vez que implementar este Widget.
  /// ```dart
  ///  Container(
  ///    height: altura,
  ///    child: EsigLoadingWidget()
  ///  ),
  /// ```
  ///  Os itens serão alinhados no centro da altura desejada.
  final double? altura;

  /// Largura total do widget. Parâmetro serve para evitar usar o código abaixo
  /// toda vez que implementar este Widget.
  /// ```dart
  ///  Container(
  ///    width: largura,
  ///    child: EsigLoadingWidget()
  ///  ),
  /// ```
  /// Os itens serão alinhados no centro da largura desejada.
  final double? largura;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ilustracaoAsset != null ? _buildIlustracao() : SizedBox(),
          loadingIndicator != LoadingIndicator.VAZIO
              ? _buildLoadingIndicator()
              : SizedBox(),
          _buildMensagem(),
        ],
      ),
    );
  }

  Container _buildIlustracao() => Container(
        padding: paddingIlustracao ?? EdgeInsets.all(8),
        constraints: tamanhoIlustracao,
        child: Image.asset(
          ilustracaoAsset!,
          fit: BoxFit.contain,
        ),
      );

  Widget _buildLoadingIndicator() => Padding(
        padding: paddingIndicator ?? EdgeInsets.all(8),
        child: loadingIndicator == LoadingIndicator.CIRCULAR
            ? CircularProgressIndicator(color: colorIndicator)
            : LinearProgressIndicator(color: colorIndicator),
      );

  Text _buildMensagem() => Text(
        mensagem,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: mensagemFontSize,
          color: corMensagem,
        ),
      );
}
