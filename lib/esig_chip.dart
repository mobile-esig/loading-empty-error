import 'package:flutter/material.dart';

class EsigChipWidget extends StatelessWidget {
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

  /// Widget internos enfileirados conforme configuração do [direcao].
  final List<Widget> children;

  /// Altura do Chip.
  final double? altura;

  /// Cor de fundo do Chip.
  final Color? corFundo;

  /// Limites dimencionais. Valor padrão é
  /// [BoxConstraints(maxWidth: 100, minWidth: 50)].
  final BoxConstraints? constraints;

  /// Raios das 4 bordas.
  final double? borderRadius;

  /// Direção na qual os Widgets em [children]  serão psicionados.
  final Axis? direcao;

  /// Alinhamento do eixo principal, tem mensma função do parâmetro
  /// [MainAxisAlignment] do Column e Row.
  final MainAxisAlignment alinhamentoPrincipal;

  /// Padding aplicado em torno dos Widgets em [children].
  final EdgeInsets? padInterno;

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
