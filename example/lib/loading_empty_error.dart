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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      SizedBox(height: 30),
      EsigErrorWidget(
        'Erro ao carregar mensagem de erro mínima',
        altura: 100,
        
      ),
      EsigErrorWidget(
        'Erro ao carregar mensagem de erro completa',
        ilustracaoAsset: 'assets/error.png',
        tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
        titulo: 'Ops...',
        tituloFontSize: 20,
        
        mensagemFontSize: 16,
        onTryAgain: () {
          print('refreshing app');
        },
        tryAgainBackgroundColor: Colors.yellowAccent,
        tryAgainTextColor: Colors.black,
      ),
      EsigLoadingWidget(
        'Carregando mensagem mínima com tamanho 100x100...',
        altura: 100,
        largura: 100,
        
      ),
      EsigLoadingWidget(
        'Preparando sua mensagem de carregamento completa com largura igual à metade da tela...',
        ilustracaoAsset: 'assets/loading.png',
        tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
        paddingIndicator: EdgeInsets.all(20),
        loadingIndicator: LoadingIndicator.LINEAR,
        
        mensagemFontSize: 16,
        largura: MediaQuery.of(context).size.width / 2,
      ),
      EsigEmptyWidget(
        'Não encontramos sua mensagem mínima de tela vazia',
        
        altura: 200,
      ),
      EsigEmptyWidget(
        'Não encontramos sua mensagem completa de tela vazia',
        ilustracaoAsset: 'assets/empty.png',
        tamanhoIlustracao: BoxConstraints(maxWidth: 140, maxHeight: 140),
        titulo: 'Ops...',
        tituloFontSize: 20,
        
        mensagemFontSize: 16,
      ),
      SizedBox(height: 60),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Exemplos')),
      body: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (context, index) => Align(
          child: widgets[index],
        ),
        separatorBuilder: (context, index) => Divider(
          thickness: 4,
          height: 30,
        ),
      ),
    );
  }
}
