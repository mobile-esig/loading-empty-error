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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ilustracaoAsset != null ? buildIlustracao() : Container(),
        titulo != null ? buildTitulo() : Container(),
        buildMensagem()
      ],
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
