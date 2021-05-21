import 'package:flutter/material.dart';

class EsigEmptyWidget extends StatelessWidget {
  final String? ilustracaoAsset;
  final BoxConstraints? tamanhoIlustracao;
  final String? titulo;
  final double? tituloFontSize;
  final EdgeInsets? tituloPadding;
  final String mensagem;
  final double? mensagemFontSize;
  final EdgeInsets? mensagemPadding;

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
