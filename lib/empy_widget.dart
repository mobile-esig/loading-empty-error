import 'package:flutter/material.dart';

/// Widget destinado aos casos nos quais a tela deveria contem informações úteis
/// mas que, por algum motivo, não estão disponíveis.
class EsigEmptyWidget extends StatelessWidget {
  const EsigEmptyWidget(
    this.mensagem, {
    Key? key,
    this.ilustracaoAsset,
    this.tamanhoIlustracao,
    this.titulo,
    this.tituloFontSize,
    this.tituloPadding = const EdgeInsets.all(8.0),
    this.mensagemFontSize,
    this.mensagemPadding = const EdgeInsets.all(8.0),
    this.altura,
    this.largura,
    this.corTexto,
  }) : super(key: key);

  /// Caminho do asset declarado no [pubspec.yaml]. A imagem está configurada
  /// com [fit: BoxFit.contain].
  final String? ilustracaoAsset;

  /// Constraints máximos e mínimos da ilustração.
  final BoxConstraints? tamanhoIlustracao;

  /// Texto em negrito logo abaixo da ilustração e acima da [menssagem].
  final String? titulo;

  /// Tamanho do texto no título.
  final double? tituloFontSize;

  /// Padding em torno do título. Padrão é [EdgeInsets.all(8.0)].
  final EdgeInsets tituloPadding;

  /// Mensagem explicando o motivo deste widget aparecer.
  final String mensagem;

  /// Tamanho da mensagem.
  final double? mensagemFontSize;

  /// Padding em torno da mensagem.
  final EdgeInsets mensagemPadding;

  final Color? corTexto;

  /// Altura total do widget. Parâmetro serve para evitar usar o código abaixo
  /// toda vez que implementar este Widget.
  /// ```dart
  ///  Container(
  ///    height: altura,
  ///    child: EsigEmptyWidget()
  ///  ),
  /// ```
  ///  Os itens serão alinhados no centro da altura desejada.
  final double? altura;

  /// Largura total do widget. Parâmetro serve para evitar usar o código abaixo
  /// toda vez que implementar este Widget.
  /// ```dart
  ///  Container(
  ///    width: largura,
  ///    child: EsigEmptyWidget()
  ///  ),
  /// ```
  /// Os itens serão alinhados no centro da largura desejada.
  final double? largura;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      height: altura,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ilustracaoAsset != null ? _buildIlustracao() : Container(),
          titulo != null ? _buildTitulo() : Container(),
          _buildMensagem()
        ],
      ),
    );
  }

  Widget _buildIlustracao() => Container(
        constraints: tamanhoIlustracao,
        child: Image.asset(
          ilustracaoAsset!,
          fit: BoxFit.contain,
        ),
      );

  Widget _buildTitulo() => Padding(
        padding: tituloPadding,
        child: Text(
          titulo!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: corTexto,
            fontSize: tituloFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _buildMensagem() => Padding(
        padding: mensagemPadding,
        child: Text(
          mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(color: corTexto, fontSize: mensagemFontSize),
        ),
      );
}
