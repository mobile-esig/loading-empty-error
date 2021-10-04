import 'package:flutter/material.dart';
import 'package:loading_empty_error/container.dart';

class EsigListOptionWidget extends StatelessWidget {
  const EsigListOptionWidget(this.children,{
    Key? key,
    
    this.corSeta = Colors.grey,
    this.tamanhoSeta = 20,
    this.corBorda = const Color(0xFFE4EDF5),
    this.corFundo,
    this.onTap,
  }) : super(key: key);

  /// Lista de Widgets enfileirados numa [Row] à esquerda da seta.
  final List<Widget> children;

  /// Cor da seta à esquerda. Para não mostrar a seta escolher a mesma cor de
  /// fundo.
  final Color? corSeta;

  /// Tamanho da seta.
  final double? tamanhoSeta;

  /// Cor da borda da opção.
  final Color? corBorda;

  /// Cor de fundo da opção.
  final Color? corFundo;

  /// Função executada ao clicar na opção.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return EsigContainerWidget(
      onTap: onTap,
      corBorda: corBorda,
      corFundo: corFundo,
      child: Row(
        children: [
          ...children,
          Icon(
            Icons.chevron_right_rounded,
            color: corSeta,
            size: tamanhoSeta,
          ),
        ],
      ),
    );
  }
}
