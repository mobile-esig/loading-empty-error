import 'package:flutter/material.dart';

/// Widget destinado aos casos nos quais a tela deveria contem informações úteis
/// mas que, por algum motivo, não estão disponíveis.
class EsigEmptyWidget extends StatelessWidget {
  const EsigEmptyWidget({
    Key? key,
    this.ilustracaoAsset,
    this.tamanhoIlustracao,
    this.titulo,
    this.tituloFontSize,
    this.tituloPadding,
    required this.mensagem,
    this.mensagemFontSize,
    this.mensagemPadding,
    this.altura,
    this.largura,
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
          ilustracaoAsset != null ? buildIlustracao() : Container(),
          titulo != null ? buildTitulo() : Container(),
          buildMensagem()
        ],
      ),
    );
  }

  Container buildIlustracao() => Container(
        constraints: tamanhoIlustracao,
        child: Image.asset(
          ilustracaoAsset!,
          fit: BoxFit.contain,
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

  Padding buildMensagem() => Padding(
        padding:
            mensagemPadding != null ? mensagemPadding! : EdgeInsets.all(8.0),
        child: Text(
          mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: mensagemFontSize),
        ),
      );
}
