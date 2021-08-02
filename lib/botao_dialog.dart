import 'package:flutter/material.dart';

/// Widget destinado a ser usado como peça nos demais presentes desse package
class EsigTextButton extends StatelessWidget {
  const EsigTextButton({
    Key? key,
    required this.texto,
    this.corFundo,
    this.onPressed,
  }) : super(key: key);

  /// Texto dentro do botão.
  final Text texto;

  /// Cor aplicado ao [backgroundColor] do botão.
  final Color? corFundo;

  /// Ação executada ao pressionar o botão.
  final void Function()? onPressed;

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
