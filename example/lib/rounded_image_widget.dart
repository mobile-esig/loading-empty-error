import 'package:flutter/material.dart';

import 'package:loading_empty_error/rounded_avatar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos dos avatares circulares',
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
  final String urlImage =
      'https://imagens.canaltech.com.br/celebridades/78.400.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 10; i > 0; i--)
                Row(
                  children: List.generate(
                    i,
                    (index) => EsigRoundedAvatarWidget(
                      largura: MediaQuery.of(context).size.width / i,
                      urlImagem: urlImage,
                      // borderRadius: 50,
                      corBorda: Colors.black,
                    ),
                  ),
                ),
              Text('Is that enough?')
            ],
          ),
        ),
      ),
    );
  }
}
