import 'package:flutter/material.dart';
import 'datetime_picker.dart';

class DateTimeFormField extends StatelessWidget {
  const DateTimeFormField({
    Key? key,
    this.onSaved,
    required this.firstDate,
    required this.initialDate,
    required this.lastDate,
    this.validator,
    this.labelText,
  }) : super(key: key);

  /// Texto com instruções
  final String? labelText;

  /// Limite inferior no calendário, datas anteriores serão inativas
  final DateTime firstDate;

  /// Primeira data selecionada ao abrir o calendário. Obrigatoriamente está entre [firstDate] e [lastDate]
  final DateTime initialDate;

  /// Limite superior no calendário, datas posteriores serão inativas
  final DateTime lastDate;

  /// Função de validação
  final String? Function(DateTime?)? validator;

  /// Função executada ao selecionar uma data válida
  final void Function(DateTime?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormField<DateTime>(
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<DateTime> state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DatePicker(
                labelText: labelText,
                firstDate: firstDate,
                lastDate: lastDate,
                initialDate: initialDate,
                onPicked: (dateTime) {
                  state.didChange(dateTime);
                  if (state.validate()) {
                    state.save();
                  }
                },
              ),
              if (state.hasError)
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    state.errorText ?? '',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
