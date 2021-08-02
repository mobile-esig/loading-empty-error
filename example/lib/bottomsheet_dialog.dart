import 'package:flutter/material.dart';
import 'package:loading_empty_error/empy_widget.dart';
import 'package:loading_empty_error/esig_bottomsheet_dialog.dart';
import 'package:loading_empty_error/esig_debug_bottomsheet.dart';
import 'package:loading_empty_error/esig_chip.dart';
import 'package:loading_empty_error/list_option.dart';

import 'package:loading_empty_error/rounded_avatar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo BottomSheetDialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Exemplos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await _showBottomSheet(42);
                print('bottomSheet result: $result');
              },
              child: Text('Abrir BottomSheetDialog'),
            ),
            ElevatedButton(
              onPressed: _showDebugBottomSheet,
              child: Text('Abrir BottomSheetDialog Debug'),
            ),
          ],
        ),
      ),
    );
  }

  _showDebugBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => EsigDebugBottomSheet(
        errors: [
          EsigDebugSection(
            titulo: 'timestamp',
            conteudo: [
              '1627913430940',
              getDateTime('1627913430940')?.toString() ?? ''
            ],
          ),
          EsigDebugSection(
              titulo: 'stacktrace', conteudo: ['Ponha qualquer texto aqui']),
          EsigDebugSection(titulo: 'message', conteudo: [
            'O texto abaixo é padrão e aparece em todos os relatórios de debug.'
          ]),
        ],
      ),
    );
  }

  DateTime? getDateTime(String timestamp) {
    final int _timestamp = int.tryParse(timestamp) ?? -1;
    return _timestamp >= 0
        ? DateTime.fromMillisecondsSinceEpoch(_timestamp)
        : null;
  }

  _showBottomSheet([dynamic result]) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => EsigBottomSheetDialog(
        height: MediaQuery.of(context).size.height / 1.2,
        result: result,
        titulo: Text('Título'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(height: 50),
            EsigChipWidget(
              children: [Text('Olá')],
            ),
            Divider(height: 50),
            ElevatedButton(onPressed: () {}, child: Text('Olá')),
            Divider(height: 50),
            EsigEmptyWidget(
              ilustracaoAsset: 'assets/empty.png',
              tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
              titulo: 'Olá',
              mensagem: 'Ponha qualquer widget aqui',
            ),
            Divider(height: 50),
            EsigRoundedAvatarWidget(
              largura: 100,
              corBorda: Colors.black,
              urlImagem: 'https://li.ctcdn.com.br/celebridades/78.400.jpg',
            ),
            Divider(height: 50),
            EsigListOptionWidget(
              children: [
                Expanded(child: Text('Olá')),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
