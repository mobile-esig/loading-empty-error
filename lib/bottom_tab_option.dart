import 'package:flutter/material.dart';

class EsigTabOptionWidget extends StatelessWidget {
  const EsigTabOptionWidget({
    Key? key,
    this.icon,
    this.texto,
    this.label,
    this.color = Colors.grey,
    this.onTap,
    this.iconSize = 25,
    this.labelSize = 12,
    this.badgeCount = 0,
  }) : super(key: key);

  /// Ícone em cima do label
  final IconData? icon;

  /// Texto em baixo do ícone. Sobrepõe-se ao [label].
  final Text? texto;

  /// Texto em baixo do ícone com estilo pré-definido
  final String? label;

  /// Tamanho do ícone
  final double iconSize;

  /// Tamanho do label
  final double labelSize;

  /// Número de notificações na opções
  final int badgeCount;

  /// Aplica-se ao ícone e ao label
  final Color color;

  /// Executado quando opção é selecionada
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Icon(icon, color: color, size: iconSize),
              if (badgeCount > 0) _buildBadge()
            ],
          ),
          texto ?? _buildTextoPadrao()
        ],
      ),
    );
  }

  Widget _buildTextoPadrao() {
    return Text(
      label ?? '',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: labelSize,
      ),
    );
  }

  Widget _buildBadge() {
    final badgeDecoration = BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(6),
    );

    final badgeStyle = TextStyle(
      color: Colors.white,
      fontSize: 8,
    );
    final badgeConstraints = BoxConstraints(
      minWidth: 12,
      minHeight: 12,
    );

    return Positioned(
      right: 0,
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: badgeDecoration,
        constraints: badgeConstraints,
        child: Center(
          child: Text(
            '$badgeCount',
            style: badgeStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
