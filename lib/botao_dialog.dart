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
        // padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(),
        backgroundColor: corFundo,
      ),
    );
  }
}

/**
bordas == true
                ? BorderSide(
                    width: 1.0,
                    color: corTexto ?? Colors.grey,
                  )
                : null,
 */
