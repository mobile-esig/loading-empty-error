import 'package:flutter/material.dart';

class EsigTextButton extends StatelessWidget {
  final Text texto;
  final Color? corFundo;
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
