import 'package:flutter/material.dart';

class EsigRoundedAvatarWidget extends StatelessWidget {
  final double largura;
  final String urlImagem;
  final double? borderRadius;
  final Color? corBorda;

  const EsigRoundedAvatarWidget({
    required this.largura,
    required this.urlImagem,
    this.borderRadius,
    this.corBorda,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      height: largura,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? largura),
        ),
        border: Border.all(color: corBorda ?? Colors.transparent),
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(urlImagem),
        ),
      ),
    );
  }
}
