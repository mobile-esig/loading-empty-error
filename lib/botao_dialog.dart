import 'package:flutter/material.dart';

/// Widget destinado a ser usado como peça nos demais presentes desse package
class EsigTextButton extends StatelessWidget {
  /// Texto dentro do botão.
  final Text texto;

  /// Cor aplicado ao [backgroundColor] do botão. Valor padrão é o mesmo do
  /// [TextButton] do Flutter.
  final Color? corFundo;

  /// Ação executada ao pressionar o botão. Valor padrão é [null].
  final void Function()? onPressed;

  const EsigTextButton({
    Key? key,
    required this.texto,
    this.corFundo,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: texto,
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(),
        backgroundColor: corFundo,
      ),
    );
  }
}
