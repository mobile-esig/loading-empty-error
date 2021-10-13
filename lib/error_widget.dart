import 'dart:ui';

import 'package:flutter/material.dart';

/// Widgets distinado aos casos nos quais ocorreu um erro interno no app e
/// alguma tarefa não pôde ser completada.
class EsigErrorWidget extends StatelessWidget {
  const EsigErrorWidget(
    this.mensagem, {
    Key? key,
    this.ilustracaoAsset,
    this.tamanhoIlustracao,
    this.titulo,
    this.tituloFontSize,
    this.tituloPadding = const EdgeInsets.all(8.0),
    this.mensagemFontSize,
    this.mensagemPadding = const EdgeInsets.all(8.0),
    this.onTryAgain,
    this.tryAgainBackgroundColor,
    this.tryAgainTextColor,
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

  /// Padding em torno do título.
  final EdgeInsets tituloPadding;

  /// Mensagem explicando o motivo deste widget aparecer.
  final String mensagem;

  /// Tamanho da mensagem.
  final double? mensagemFontSize;

  /// Padding em torno da mensagem.
  final EdgeInsets mensagemPadding;

  /// Cor do texto do título e mensagem
  final Color? corTexto;

  /// Função chamada ao apertar botão TENTAR NOVAMENTE. O botão só é exibido se
  /// o parâmetro receber um valor.
  final void Function()? onTryAgain;

  /// cor no fundo do botão. Valor é atribuído ao
  /// [backgroundColor] do [ButtonStyle].
  final Color? tryAgainBackgroundColor;

  /// Cor do texto dentro do botão de TENTAR NOVAMENTE. Valor é atribuído ao
  /// [foregroundColor] do [ButtonStyle].
  final Color? tryAgainTextColor;

  /// Altura total do widget. Parâmetro serve para evitar usar o código abaixo
  /// toda vez que implementar este Widget.
  /// ```dart
  ///  Container(
  ///    height: altura,
  ///    child: EsigErrorWidget()
  ///  ),
  /// ```
  ///  Os itens serão alinhados no centro da altura desejada.
  final double? altura;

  /// Largura total do widget. Parâmetro serve para evitar usar o código abaixo
  /// toda vez que implementar este Widget.
  /// ```dart
  ///  Container(
  ///    width: largura,
  ///    child: EsigErrorWidget()
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
        children: <Widget>[
          ilustracaoAsset != null ? _buildIlustracao() : Container(),
          titulo != null ? _buildTitulo() : Container(),
          _buildMensagem(),
          onTryAgain != null ? _buildBotaoRefresh(context) : Container()
        ],
      ),
    );
  }

  Widget _buildBotaoRefresh(BuildContext context) => ElevatedButton(
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

  Widget _buildMensagem() => Padding(
        padding: mensagemPadding,
        child: Text(
          mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: mensagemFontSize, color: corTexto),
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

  Widget _buildIlustracao() => Container(
        constraints: tamanhoIlustracao,
        child: Image.asset(
          ilustracaoAsset!,
          fit: BoxFit.contain,
        ),
      );
}
