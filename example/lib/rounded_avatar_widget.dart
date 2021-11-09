import 'package:flutter/material.dart';

import 'package:loading_empty_error/rounded_avatar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos dos avatares circulares',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final String urlImage =
      'https://imagens.canaltech.com.br/celebridades/78.400.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplos dos avatares')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            for (var i = 10; i > 0; i--)
              Row(
                children: List.generate(
                  i,
                  (index) => EsigRoundedAvatarWidget(
                    MediaQuery.of(context).size.width / i,
                    urlImage,
                    corBorda: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
