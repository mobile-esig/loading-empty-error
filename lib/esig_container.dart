import 'package:flutter/material.dart';

/// Container clicável com uma discreta borda.
class EsigContainerWidget extends StatelessWidget {
  const EsigContainerWidget({
    Key? key,
    this.onTap,
    required this.child,
    this.corBorda = const Color(0xFFE4EDF5),
    this.corFundo = Colors.transparent,
  }) : super(key: key);

  /// Ação executada ao clicar no Widget. Valor padrão é [null].
  final void Function()? onTap;

  /// Cor aplicada às bordas do [Container]. Valor padrão é [Color(0xFFE4EDF5)],
  /// um cinza claro.
  final Color? corBorda;

  /// Cor de fundo do [Container]. Valor padrão é [Colors.transparent].
  final Color? corFundo;

  /// Assim como o parâmetro [child] do [Container], é o seu conteúdo interno.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
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
