import 'package:flutter/material.dart';

import 'package:loading_empty_error/empy_widget.dart';
import 'package:loading_empty_error/error_widget.dart';
import 'package:loading_empty_error/loading_widget.dart';
import 'package:loading_empty_error/loading_indicator_type.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos de erros, carregamentos e vazios',
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
    List<Widget> widgets = [
      SizedBox(height: 30),
      Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: EsigErrorWidget(
          mensagem: 'Erro ao carregar mensagem de erro mínima',
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: EsigErrorWidget(
          ilustracaoAsset: 'assets/error.png',
          tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
          titulo: 'Ops...',
          tituloFontSize: 20,
          mensagem: 'Erro ao carregar mensagem de erro completa',
          mensagemFontSize: 16,
          onTryAgain: () {
            print('refreshing app');
          },
          tryAgainBackgroundColor: Colors.yellowAccent,
          tryAgainTextColor: Colors.black,
        ),
      ),
      Container(
        child: EsigLoadingWidget(
          mensagem: 'Preparando sua mensagem de carregamento mínima...',
        ),
      ),
      Container(
        child: EsigLoadingWidget(
          ilustracaoAsset: 'assets/loading.png',
          tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
          paddingIndicator: EdgeInsets.all(20),
          loadingIndicator: LoadingIndicator.LINEAR,
          mensagem: 'Preparando sua mensagem de carregamento completa...',
          mensagemFontSize: 16,
        ),
      ),
      EsigEmptyWidget(
          mensagem: 'Não encontramos sua mensagem mínima de tela vazia'),
      EsigEmptyWidget(
        ilustracaoAsset: 'assets/empty.png',
        tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
        titulo: 'Ops...',
        tituloFontSize: 20,
        mensagem: 'Não encontramos sua mensagem completa de tela vazia',
        mensagemFontSize: 16,
      ),
      SizedBox(height: 60),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(thickness: 4, color: Colors.black),
        ),
      ),
    );
  }
}
