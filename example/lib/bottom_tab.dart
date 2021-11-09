import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:loading_empty_error/bottom_tab.dart';
import 'package:loading_empty_error/bottom_tab_option.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de BottomTab',
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int badgeEstudante = 0;

  incrementBadgeEstudante() {
    setState(() {
      badgeEstudante++;
    });
  }

  decrementBadgeEstudante() {
    setState(() {
      badgeEstudante--;
    });
  }

  Color getColor(int valor) {
    if (valor > 0) return Colors.green;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo de BottomTab')),
      body: Center(
        child: EsigOptionBarWidget(
          options: [
            EsigTabOptionWidget(
              icon: Icons.person_outline_rounded,
              badgeCount: badgeEstudante,
              texto: Text(
                'Estudante',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            EsigTabOptionWidget(
              icon: Icons.person,
              badgeCount: -badgeEstudante,
              onTap: decrementBadgeEstudante,
              texto: Text(
                'Professor',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: EsigOptionBarWidget(
        options: [
          EsigTabOptionWidget(
            label: 'FINANCEIRO',
            icon: Icons.monetization_on,
            onTap: incrementBadgeEstudante,
            color: getColor(badgeEstudante),
          ),
          EsigTabOptionWidget(
            icon: Icons.mail,
            label: 'MENSAGENS',
            onTap: decrementBadgeEstudante,
            color: getColor(badgeEstudante),
          ),
          EsigTabOptionWidget(
            icon: Icons.message_outlined,
            label: 'COMUNICADOS',
            onTap: incrementBadgeEstudante,
            color: getColor(badgeEstudante),
          ),
        ],
      ),
    );
  }
}
