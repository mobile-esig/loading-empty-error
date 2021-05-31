import 'package:flutter/material.dart';
import 'package:loading_empty_error/botao_dialog.dart';
import 'package:loading_empty_error/custom_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos das janelas de diálogo',
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
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EsigTextButton(
              texto: Text('Abrir dialog vertical'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EsigDialogWidget(
                    direcaoBotoes: Axis.vertical,
                    icone: Icon(
                      Icons.alarm,
                      size: 40,
                      color: Colors.blue,
                    ),
                    mensagem: 'Mensagem do alert',
                    titulo: 'Título do alert',
                    tamanhoTitulo: 14,
                    onPressedPrincipal: () {},
                    textoPrincipal: Text('SIM'),
                    onPressedSecundario: () {},
                    textoSecundario: Text('NÃO'),
                  ),
                );
              },
            ),
            EsigTextButton(
              texto: Text('Abrir dialog horizontal'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EsigDialogWidget(
                    direcaoBotoes: Axis.horizontal,
                    icone: Icon(
                      Icons.alarm,
                      color: Colors.blue,
                    ),
                    mensagem: 'Mensagem do alert',
                    titulo: 'Título do alert',
                    tamanhoTitulo: 14,
                    onPressedPrincipal: () {},
                    textoPrincipal: Text('SIM'),
                    onPressedSecundario: () {},
                    textoSecundario: Text('NÃO'),
                  ),
                );
              },
            ),
            Container(
              height: 300,
              child: EsigDialogWidget(
                titulo: 'Título Horizontal',
                mensagem:
                    'Mensagem horizontal exemplificada diretamente na tela',
                direcaoBotoes: Axis.horizontal,
                onPressedPrincipal: () {},
                textoPrincipal: Text('SIM'),
                onPressedSecundario: () {},
                textoSecundario: Text('NÃO'),
              ),
            ),
            Container(
              height: 300,
              child: EsigDialogWidget(
                titulo: 'Título Vertical exemplificado diretamente na tela',
                mensagem: 'Mensagem vertical',
                direcaoBotoes: Axis.vertical,
                onPressedPrincipal: () {},
                textoPrincipal: Text('SIM BEM GRANDE'),
                onPressedSecundario: () {},
                textoSecundario: Text('NÃO BEM GRANDE TAMBÉM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
