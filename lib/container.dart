import 'package:flutter/material.dart';

/// Container clicável com uma discreta borda.
class EsigContainerWidget extends StatelessWidget {
  const EsigContainerWidget({
    Key? key,
    this.onTap,
    required this.child,
    this.corBorda,
    this.corFundo = Colors.transparent,
    this.padding,
    this.margin,
  }) : super(key: key);

  /// Espaçamento interno aplicado ao Container.
  final EdgeInsets? padding;

  /// Espaçamento externo aplicado ao Container.
  final EdgeInsets? margin;

  /// Ação executada ao clicar no Widget.
  final void Function()? onTap;

  /// Cor aplicada às bordas do [Container].
  final Color? corBorda;

  /// Cor de fundo do [Container].
  final Color? corFundo;

  /// O seu conteúdo interno, assim como o parâmetro [child] do [Container].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        decoration: BoxDecoration(
          color: corFundo,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 1,
            color: corBorda ?? Color(0xFFE4EDF5),
          ),
        ),
        child: child,
      ),
    );
  }
}
