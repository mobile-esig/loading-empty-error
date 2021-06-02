import 'package:flutter/material.dart';

class EsigListOption extends StatelessWidget {
  /// Lista de Widgets enfileirados numa [Row] à esquerda da seta.
  final List<Widget> children;

  /// Cor da seta à esquerda. Para não mostrar a seta escolher a mesma cor de
  /// fundo. Valor padrão é [Colors.grey].
  final Color? corSeta;

  /// Tamanho da seta. Valor padrão é 20.
  final double? tamanhoSeta;

  /// Cor da borda da opção. Valor padrão é [Color(0xFFE4EDF5)].
  final Color? corBorda;

  /// Cor de fundo da opção. Valor padrão é o mesmo do [Container] do Flutter
  final Color? corFundo;

  /// Função executada ao clicar na opção.
  final void Function()? onTap;

  const EsigListOption({
    Key? key,
    required this.children,
    this.corSeta = Colors.grey,
    this.tamanhoSeta = 20,
    this.corBorda = const Color(0xFFE4EDF5),
    this.corFundo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: corFundo,
        border: Border.all(width: 1, color: corBorda!),
      ),
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}
