import 'package:flutter/material.dart';
import 'package:loading_empty_error/container.dart';

// TODO(victor): widget usado para enviar arquivos
class EsigUploadFileWidget extends StatefulWidget {
  final void Function()? onTap;
  final IconData? icone;
  final String? texto;
  const EsigUploadFileWidget({
    Key? key,
    this.onTap,
    this.icone,
    this.texto = 'Escolher arquivo',
  }) : super(key: key);

  @override
  _EsigUploadFileWidgetState createState() => _EsigUploadFileWidgetState();
}

class _EsigUploadFileWidgetState extends State<EsigUploadFileWidget> {
  @override
  Widget build(BuildContext context) {
    return EsigContainerWidget(
      child: Row(
        children: [],
      ),
    );
  }
}
