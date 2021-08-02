import 'package:flutter/material.dart';

import 'package:loading_empty_error/esig_bottomsheet_dialog.dart';

class EsigDebugBottomSheet extends StatelessWidget {
  const EsigDebugBottomSheet({
    Key? key,
    this.errors = const [],
  }) : super(key: key);

  final List<EsigDebugSection> errors;

  @override
  Widget build(BuildContext context) {
    List<Widget> _errors = errors.map((e) => _buildSecao(e)).toList();
    _errors.add(
      _buildSecao(
        EsigDebugSection(
          titulo: 'INSTRUÇÕES',
          conteudo: [
            'Essas informações ajudarão na identificação e resolução do problema. Envie para o time responsável pelo app.'
          ],
        ),
      ),
    );

    return EsigBottomSheetDialog(
      height: MediaQuery.of(context).size.height / 1.1,
      titulo: Text('Relatório'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _errors,
      ),
    );
  }

  Widget _buildSecao(EsigDebugSection err) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 20),
          Text(
            err.titulo.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ...err.conteudo
              .map(
                (c) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: Text(c, textAlign: TextAlign.justify),
                ),
              )
              .toList(),
        ],
      );
}

class EsigDebugSection {
  String titulo;
  List<String> conteudo;

  EsigDebugSection({
    required this.titulo,
    required this.conteudo,
  });
}
