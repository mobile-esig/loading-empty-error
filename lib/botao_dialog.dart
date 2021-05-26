import 'package:flutter/material.dart';

class EsigTextButton extends StatelessWidget {
  final String texto;
  final Color? corTexto;
  final Color? corFundo;

  final bool? bordas;

  final void Function()? onPressed;

  const EsigTextButton({
    Key? key,
    required this.texto,
    this.corTexto,
    this.corFundo,
    this.bordas,
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
        side: BorderSide(
          width: bordas == true ? 1.0 : 0.0,
        ),
        backgroundColor: corFundo,
      ),
    );
  }
}
