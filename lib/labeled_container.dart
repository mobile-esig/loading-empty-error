import 'package:flutter/material.dart';

import 'container.dart';

class LabeledContainerWidget extends StatelessWidget {
  /// Texto do label na borda.
  final String label;

  /// Estilo do [label]
  final TextStyle? labelStyle;

  /// Alinhamento do [label]
  final Alignment? labelAlignment;

  /// Cor de fundo do [label]
  final Color? corFundoLabel;

  /// Conteúdo do container
  final Widget child;

  /// Espaçamento interno aplicado em todas as bordas
  final double padding;

  /// Ação executada ao clicar no Widget
  final void Function()? onTap;

  /// Cor aplicada às bordas do [Container]
  final Color? corBorda;

  const LabeledContainerWidget({
    Key? key,
    required this.label,
    this.labelAlignment,
    this.labelStyle,
    required this.child,
    this.onTap,
    this.corBorda,
    this.corFundoLabel,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: labelStyle,
    );

    final marginTop = (text.style?.fontSize ?? 14) / 2;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        EsigContainerWidget(
          child: child,
          margin: EdgeInsets.only(top: marginTop),
          padding: EdgeInsets.all(16 + padding),
          onTap: onTap,
          corBorda: corBorda,
          corFundo: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Align(
            alignment: labelAlignment ?? Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              color: corFundoLabel ?? Theme.of(context).scaffoldBackgroundColor,
              child: text,
            ),
          ),
        ),
      ],
    );
  }
}
