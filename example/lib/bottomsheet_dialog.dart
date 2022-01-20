import 'package:flutter/material.dart';
import 'package:loading_empty_error/empy_widget.dart';
import 'package:loading_empty_error/bottomsheet_dialog.dart';
import 'package:loading_empty_error/debug_bottomsheet.dart';
import 'package:loading_empty_error/chip.dart';
import 'package:loading_empty_error/list_option.dart';
import 'dart:developer' as developer;

import 'package:loading_empty_error/rounded_avatar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo BottomSheetDialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo BottomSheetDialog')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Abrir BottomSheetDialog'),
              onPressed: () async {
                final result = await _showBottomSheet(42);
                developer.log('bottomSheet result: $result');
              },
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
            titulo: 'stacktrace',
            conteudo: ['Ponha qualquer texto aqui'],
          ),
          EsigDebugSection(
            titulo: 'message',
            conteudo: [
              'O texto abaixo é padrão e aparece em todos os relatórios de debug.'
            ],
          ),
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
            SizedBox(height: 30),
            EsigChipWidget(
              children: const [Text('Olá')],
            ),
            Divider(height: 50),
            ElevatedButton(onPressed: () {}, child: Text('Olá')),
            Divider(height: 50),
            EsigEmptyWidget(
              'Ponha qualquer widget aqui',
              ilustracaoAsset: 'assets/empty.png',
              tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
              titulo: 'Olá',
            ),
            Divider(height: 50),
            EsigRoundedAvatarWidget(
              100,
              'https://li.ctcdn.com.br/celebridades/78.400.jpg',
              corBorda: Colors.black,
            ),
            Divider(height: 50),
            EsigListOptionWidget(
              const [
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
