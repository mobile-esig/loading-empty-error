import 'package:flutter/material.dart';

class EsigRoundedAvatarWidget extends StatelessWidget {
  const EsigRoundedAvatarWidget(
    this.largura,
    this.urlImagem, {
    Key? key,
    this.borderRadius,
    this.corBorda,
  }) : super(key: key);

  /// Largura do widget. É sempre igual à altura.
  final double largura;

  /// URL da imagem interna
  final String urlImagem;

  /// Raio da borda. Se nenhum valor for dado, é igual à [largura], o widget
  /// forma um círculo.
  final double? borderRadius;

  /// Cor da borda. Valor padrão é [Colors.transparent].
  final Color? corBorda;

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
