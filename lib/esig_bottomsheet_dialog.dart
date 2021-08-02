import 'package:flutter/material.dart';

class EsigBottomSheetDialog extends StatelessWidget {
  const EsigBottomSheetDialog({
    Key? key,
    this.height,
    required this.child,
    this.titulo = const Text('TÍTULO'),
    this.closeIcon = const Icon(Icons.close, color: Colors.black),
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.result,
  }) : super(key: key);

  /// Conteúdo do BottomSheet.
  final Widget child;

  /// Texto centralizado no cabeçalho do BottomSheet.
  final Text titulo;

  /// Tamanho do BottomSheet.
  final double? height;

  /// Valor retornado após o BottomSheet ser dispensado.
  final dynamic result;

  /// Ícone usado para fechar o BottomSheet.
  final Icon? closeIcon;

  /// padding aplicado ao conteúdo do BottomSheet.
  final EdgeInsets padding;

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
      child: SingleChildScrollView(
        padding: padding,
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildCabecalho(context),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildCabecalho(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            child: closeIcon,
            onTap: () => Navigator.pop(context, result),
          ),
        ),
        titulo,
      ],
    );
  }
}
