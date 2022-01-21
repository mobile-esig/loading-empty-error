import 'package:flutter/material.dart';
import 'package:loading_empty_error/labeled_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos de Containers nomeados',
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color corBackground = Colors.white;

  @override
  Widget build(BuildContext context) {
    List<Widget> opcoes = [
      SizedBox(height: 10),
      ElevatedButton(
        child: Text('Alternar cor do background'),
        onPressed: () {
          final corScaffold = Theme.of(context).scaffoldBackgroundColor;
          setState(() {
            corBackground =
                corBackground == Colors.red ? corScaffold : Colors.red;
          });
        },
      ),
      LabeledContainerWidget(
        label: 'Label',
        child: Center(
          child: Text('Exemplo label à esquerda'),
        ),
      ),
      LabeledContainerWidget(
        label: 'Texto',
        labelAlignment: Alignment.center,
        child: Center(
          child: Text('Exemplo label no centro'),
        ),
      ),
      LabeledContainerWidget(
        label: 'Label Maior',
        labelAlignment: Alignment.topRight,
        child: Center(
          child: Text('Exemplo à direita'),
        ),
      ),
      LabeledContainerWidget(
        label: 'Noite',
        corFundoLabel: Colors.red,
        child: Center(
          child: Text(
            'Exemplo cor de fundo do label. Container é sempre transparente.',
          ),
        ),
      ),
      LabeledContainerWidget(
        label: 'Label',
        labelStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 29,
        ),
        child: Center(
          child: Text(
            'Exemplo label com estilo. Notar a margem do top maior por causa do texto maior.',
          ),
        ),
      ),
      LabeledContainerWidget(
        label: 'Label Label Label Label Maior',
        padding: 20,
        child: Center(
          child: Text('Exemplo de padding maior'),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: corBackground,
      appBar: AppBar(
        title: Text('Exemplos de Containers nomeados'),
      ),
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
