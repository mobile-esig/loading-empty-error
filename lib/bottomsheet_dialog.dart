import 'package:flutter/material.dart';

class EsigBottomSheetDialog extends StatelessWidget {
  const EsigBottomSheetDialog({
    Key? key,
    this.height,
    required this.child,
    this.titulo,
    this.closeIcon,
    this.padding,
    this.result,
  }) : super(key: key);

  /// Conteúdo do BottomSheet.
  final Widget child;

  /// Texto centralizado no cabeçalho do BottomSheet.
  final Text? titulo;

  /// Tamanho do BottomSheet.
  final double? height;

  /// Valor retornado após o BottomSheet ser dispensado.
  final dynamic result;

  /// Ícone usado para fechar o BottomSheet.
  final Icon? closeIcon;

  /// padding aplicado ao conteúdo do BottomSheet.
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height / 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          _buildCabecalho(context),
          Divider(height: 1),
          Flexible(
            child: SingleChildScrollView(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCabecalho(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: closeIcon ?? Icon(Icons.close, color: Colors.black),
              onTap: () => Navigator.pop(context, result),
            ),
          ),
          titulo ?? Text('TÍTULO'),
        ],
      ),
    );
  }
}
