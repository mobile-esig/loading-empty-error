import 'package:flutter/material.dart';
import 'package:loading_empty_error/utils/extensions/date_time_ext.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    this.onPicked,
    required this.firstDate,
    required this.initialDate,
    required this.lastDate,
    this.labelText,
  }) : super(key: key);

  /// Limite inferior no calendário, datas anteriores serão inativas
  final DateTime firstDate;

  /// Primeira data selecionada ao abrir o calendário. Obrigatoriamente está entre [firstDate] e [lastDate]
  final DateTime initialDate;

  /// Limite superior no calendário, datas posteriores serão inativas
  final DateTime lastDate;

  /// Chamado ao fechar o calendário após selecionar uma data
  final void Function(DateTime?)? onPicked;

  /// Texto com instruções
  final String? labelText;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var picked = DateTime.now();
  late final _dateCtrl = TextEditingController(text: picked.formattedDate());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _dismissKeyboard(context);

        DateTime? d = await _selectDate(context);
        if (d != null) {
          setState(() {
            picked = d;
            _dateCtrl.text = picked.formattedDate();
          });
          widget.onPicked?.call(picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateCtrl,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: widget.labelText ?? 'Escolha uma data',
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      firstDate: widget.firstDate,
      initialDate: widget.initialDate,
      lastDate: widget.lastDate,
    );
  }

  void _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

// Fonte do widget: https://www.refactord.com/guides/flutter-text-field-date-picker