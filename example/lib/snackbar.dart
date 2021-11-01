import 'package:flutter/material.dart';
import 'package:loading_empty_error/snackbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Snackbar',
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
  final String mensagemSnackBar =
      'Exemplo de mensagem. Para me dispensar, aperte o botão ao lado com o nome \'Fechar\' ou me deslize para baixo.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Snackbar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Snackbar simples com contexto'),
              onPressed: () {
                getEsigSnackBar(
                  mensagemSnackBar,
                  context: context,
                  duracao: 20,
                );
              },
            ),
            ElevatedButton(
              child: Text('Snackbar simples sem contexto'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  getEsigSnackBar(mensagemSnackBar, duracao: 20)!,
                );
              },
            ),
            ElevatedButton(
              child: Text('Snackbar Sucesso'),
              onPressed: () {
                getEsigSnackBar(
                  'Tarefa realizada com sucesso.',
                  context: context,
                  duracao: 20,
                  corFundo: Colors.green,
                  icon: Icons.check,
                );
              },
            ),
            ElevatedButton(
              child: Text('Snackbar Erro'),
              onPressed: () {
                getEsigSnackBar(
                  'Não foi possível realizar tarefa. Cód 500',
                  context: context,
                  duracao: 20,
                  corFundo: Colors.red,
                  icon: Icons.error,
                );
              },
            ),
            ElevatedButton(
              child: Text('Snackbar com bottom padding'),
              onPressed: () {
                getEsigSnackBar(
                  'Tarefa realizada com sucesso.',
                  context: context,
                  duracao: 20,
                  padding: EdgeInsets.only(bottom: 40),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
