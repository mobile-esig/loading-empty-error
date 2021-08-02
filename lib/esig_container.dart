import 'package:flutter/material.dart';

/// Container clicável com uma discreta borda.
class EsigContainerWidget extends StatelessWidget {
  const EsigContainerWidget({
    Key? key,
    this.onTap,
    required this.child,
    this.corBorda = const Color(0xFFE4EDF5),
    this.corFundo = Colors.transparent,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  /// Espaçamento interno aplicado ao Container. Valor padrão é
  /// [EdgeInsets.symmetric(horizontal: 15, vertical: 9)]
  final EdgeInsets? padding;

  /// Espaçamento externo aplicado ao Container. Valor padrão é
  /// [EdgeInsets.zero]
  final EdgeInsets? margin;

  /// Ação executada ao clicar no Widget.
  final void Function()? onTap;

  /// Cor aplicada às bordas do [Container].
  final Color? corBorda;

  /// Cor de fundo do [Container].
  final Color? corFundo;

  /// Assim como o parâmetro [child] do [Container], é o seu conteúdo interno.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: corFundo,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 1,
            color: corBorda!,
          ),
        ),
        child: child,
      ),
    );
  }
}
