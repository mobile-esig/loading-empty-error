import 'package:flutter/material.dart';
import 'package:loading_empty_error/botao_dialog.dart';
import 'package:loading_empty_error/custom_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos das janelas de diálogo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
      appBar: AppBar(title: Text('Exemplos de dialogs')),
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
                    'Mensagem do alert',
                    direcaoBotoes: Axis.vertical,
                    icone: Icon(
                      Icons.alarm,
                      size: 40,
                      color: Colors.blue,
                    ),
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
                    'Mensagem do alert',
                    direcaoBotoes: Axis.horizontal,
                    icone: Icon(
                      Icons.alarm,
                      color: Colors.blue,
                    ),
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
            EsigDialogWidget(
              'dialog sem opções',
              titulo: 'Exemplo Vertical',
              direcaoBotoes: Axis.vertical,
            ),
            EsigDialogWidget(
              'dialog sem opções',
              titulo: 'Exemplo Horizontal',
              direcaoBotoes: Axis.horizontal,
            ),
            EsigDialogWidget(
              'Mensagem horizontal exemplificada diretamente na tela',
              titulo: 'Título Horizontal',
              direcaoBotoes: Axis.horizontal,
              onPressedPrincipal: () {},
              textoPrincipal: Text('SIM'),
              onPressedSecundario: () {},
              textoSecundario: Text('NÃO'),
            ),
            EsigDialogWidget(
              'Mensagem vertical',
              titulo: 'Título Vertical exemplificado diretamente na tela',
              direcaoBotoes: Axis.vertical,
              onPressedPrincipal: () {},
              textoPrincipal: Text('SIM BEM GRANDE'),
              onPressedSecundario: () {},
              textoSecundario: Text('NÃO BEM GRANDE TAMBÉM'),
            ),
          ],
        ),
      ),
    );
  }
}
