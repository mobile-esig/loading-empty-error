import 'package:flutter/material.dart';
import 'package:loading_empty_error/esig_chip.dart';

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
    List<Widget> chips = [
      EsigChipWidget(
        constraints: BoxConstraints.tightForFinite(),
        children: [
          SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.blue,
            ),
          ),
          SizedBox(width: 6),
          Text('Francisca Xavier'.toUpperCase()),
          SizedBox(width: 6),
        ],
      ),
      Divider(height: 30),
      EsigChipWidget(
        constraints: BoxConstraints.tightForFinite(),
        children: [
          SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Icon(
              Icons.timer,
              size: 20,
            ),
          ),
          SizedBox(width: 6),
          Text('de manhã'.toUpperCase()),
          SizedBox(width: 6),
        ],
      ),
      Divider(height: 30),
      EsigChipWidget(
        corFundo: Colors.blue[900],
        constraints: BoxConstraints.tightForFinite(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'matriculado'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
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
