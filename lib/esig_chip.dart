import 'package:flutter/material.dart';

class EsigChipWidget extends StatelessWidget {
  final List<Widget> children;
  final double? altura;
  final Color? corFundo;
  final BoxConstraints? constraints;
  final double? borderRadius;
  final Axis? direcao;
  final MainAxisAlignment alinhamentoPrincipal;

  const EsigChipWidget({
    Key? key,
    required this.children,
    this.altura = 25,
    this.corFundo = const Color(0xFFE4EDF5),
    this.borderRadius = 4,
    this.constraints = const BoxConstraints(maxWidth: 100, minWidth: 50),
    this.direcao = Axis.horizontal,
    this.alinhamentoPrincipal = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      constraints: constraints,
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Flex(
        direction: direcao!,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: alinhamentoPrincipal,
        children: children,
      ),
    );
  }
}
