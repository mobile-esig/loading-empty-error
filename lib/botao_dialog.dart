import 'package:flutter/material.dart';

class EsigTextButton extends StatelessWidget {
  final String texto;
  final Color? corTexto;
  final Color? corFundo;
  final void Function()? onPressed;

  const EsigTextButton({
    Key? key,
    required this.texto,
    this.corTexto,
    this.corFundo,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        texto,
        style: TextStyle(color: corTexto),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(),
        backgroundColor: corFundo,
      ),
    );
  }
}
