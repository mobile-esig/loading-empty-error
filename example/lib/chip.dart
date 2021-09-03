import 'package:flutter/material.dart';
import 'package:loading_empty_error/chip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplos dos chips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    List<Widget> chips = [
      EsigChipWidget(
        padInterno: EdgeInsets.symmetric(horizontal: 6),
        constraints: BoxConstraints.tightForFinite(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.blue,
            ),
          ),
          SizedBox(width: 6),
          Text('Francisca Xavier'.toUpperCase()),
        ],
      ),
      Divider(height: 30),
      EsigChipWidget(
        padInterno: EdgeInsets.symmetric(horizontal: 6),
        constraints: BoxConstraints.tightForFinite(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Icon(
              Icons.schedule,
              size: 20,
            ),
          ),
          SizedBox(width: 6),
          Text('de manhã'.toUpperCase()),
        ],
      ),
      Divider(height: 30),
      EsigChipWidget(
        padInterno: EdgeInsets.symmetric(horizontal: 8),
        corFundo: Colors.blue[900],
        constraints: BoxConstraints.tightForFinite(),
        children: [
          Text(
            'matriculado'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Divider(height: 30),
      EsigChipWidget(
        direcao: Axis.vertical,
        constraints: BoxConstraints.tightForFinite(height: 100, width: 100),
        children: [
          Text('Exemplo'.toUpperCase()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Quadrado'.toUpperCase()),
          ),
          Text('E vertical'.toUpperCase()),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Exemplos dos chips')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: chips,
          ),
        ),
      ),
    );
  }
}
