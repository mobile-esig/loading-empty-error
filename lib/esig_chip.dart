import 'package:flutter/material.dart';

class EsigChipWidget extends StatelessWidget {
  /// Widget internos enfileirados conforme configuração do [direcao].
  final List<Widget> children;

  /// Altura do Chip. Valor padrão é 25.
  final double? altura;

  /// Cor de fundo do Chip. Valor padrão é [Color(0xFFE4EDF5)], um cinza claro.
  final Color? corFundo;

  /// Limites dimencionais. Valor padrão é
  /// [BoxConstraints(maxWidth: 100, minWidth: 50)].
  final BoxConstraints? constraints;

  /// Raios das 4 bordas. Valor padrão é 4.
  final double? borderRadius;

  /// Direção na qual os Widgets em [children]  serão psicionados. Valor padrão
  /// é [Axis.horizontal]
  final Axis? direcao;

  /// Alinhamento do eixo principal, tem mensma função do parâmetro
  /// [MainAxisAlignment] do Column e Row. Valor padrão é
  /// [MainAxisAlignment.center].
  final MainAxisAlignment alinhamentoPrincipal;

  /// Padding aplicado em torno dos Widgets em [children]. Valor padrão é
  /// [EdgeInsets.zero].
  final EdgeInsets? padInterno;

  const EsigChipWidget({
    Key? key,
    required this.children,
    this.altura = 25,
    this.corFundo = const Color(0xFFE4EDF5),
    this.borderRadius = 4,
    this.constraints = const BoxConstraints(maxWidth: 100, minWidth: 50),
    this.direcao = Axis.horizontal,
    this.alinhamentoPrincipal = MainAxisAlignment.center,
    this.padInterno = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padInterno,
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
