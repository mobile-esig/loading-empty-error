import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_empty_error/datetime/daterange_form_field.dart';
import 'package:loading_empty_error/datetime/datetime_form_field.dart';
import 'package:loading_empty_error/utils/enums/input_border_enum.dart';
import 'package:loading_empty_error/utils/extensions/date_time_range_ext.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Datetime e DateRange picker',
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
  final _formKey = GlobalKey<FormState>();

  var dataSelecionada = DateTime.now();
  var intervaloSelecionado = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo de DatePickers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Valor escolhido no DateTimeFormField: $dataSelecionada',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              DateTimeFormField(
                labelText: 'Escolha uma data no ano atual',
                firstDate: DateTime.now().subtract(Duration(days: 500)),
                initialDate: dataSelecionada,
                lastDate: DateTime.now().add(Duration(days: 7)),
                borderType: InputBorderType.OUTLINED,
                onSaved: (DateTime? datetime) {
                  setState(() {
                    if (datetime != null) {
                      dataSelecionada = datetime;
                    }
                  });
                },
                validator: (DateTime? datetime) {
                  if (datetime == null) return 'Selecione uma data';
                  if (datetime.year != DateTime.now().year) {
                    return 'Selecione uma data no ano atual';
                  }
                },
              ),
              SizedBox(height: 100),
              Text(
                'Valor escolhido no DateRangeFormField: ${intervaloSelecionado.formattedDateRange()}',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              DateRangeFormField(
                labelText: 'Escolha um período contido no ano atual',
                firstDate: DateTime.now().subtract(Duration(days: 500)),
                lastDate: DateTime.now().add(Duration(days: 7)),
                initialDateRange: intervaloSelecionado,
                // borderType: InputBorderType.UNDERLINE,
                onSaved: (DateTimeRange? daterange) {
                  setState(() {
                    if (daterange != null) {
                      intervaloSelecionado = daterange;
                    }
                  });
                },
                validator: (DateTimeRange? daterange) {
                  if (daterange == null) return 'Selecione um intervalo';
                  if (daterange.start.year != DateTime.now().year ||
                      daterange.end.year != DateTime.now().year) {
                    return 'Selecione um intervalo contido no ano atual';
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
