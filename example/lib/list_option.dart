import 'package:flutter/material.dart';
import 'package:loading_empty_error/custom_dialog.dart';

import 'package:loading_empty_error/list_option.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos das opções em listas',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
    List<Widget> opcoes = [
      EsigListOption(
        children: [
          Image.asset(
            'assets/error.png',
            width: 50,
          ),
          SizedBox(width: 18),
          Expanded(
            child: Text(
              'ATIVIDADES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF444444),
              ),
            ),
          ),
        ],
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return EsigDialogWidget(
                titulo: 'Parabéns!',
                mensagem: 'Você clicou na primeira opção',
              );
            },
          );
        },
      ),
      EsigListOption(
        children: [
          Image.asset(
            'assets/loading.png',
            width: 50,
          ),
          SizedBox(width: 18),
          Expanded(
            child: Text('FÓRUM DE LONGAS INFIDÁVEIS PRODUTIVAS DISCUSSÕES'),
          ),
        ],
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return EsigDialogWidget(
                titulo: 'Parabéns!',
                mensagem: 'Você clicou na segunda opção',
              );
            },
          );
        },
      ),
      EsigListOption(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The core skills needed to manage in Flutter',
                  style: TextStyle(
                    color: Color(0xFF444444),
                  ),
                ),
                Text('21/05/2021 à 04/06/2021'),
                Text('21/05/2021 à 04/06/2021'),
                Text('21/05/2021 à 04/06/2021'),
                Text('21/05/2021 à 04/06/2021'),
                Text(
                    'Ponha qualquer tamanho, o widget adaptará sua altura para que o consteúdo fique dentro das bordas'),
              ],
            ),
          )
        ],
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return EsigDialogWidget(
                titulo: 'Parabéns!',
                mensagem: 'Você concluiu o tutorial',
              );
            },
          );
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: opcoes
              .map(
                (e) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
