import 'package:flutter/material.dart';
import 'package:loading_empty_error/utils/enums/input_border_enum.dart';

import 'daterange_picker.dart';

class DateRangeFormField extends StatelessWidget {
  const DateRangeFormField({
    Key? key,
    required this.firstDate,
    required this.lastDate,
    required this.initialDateRange,
    this.onSaved,
    this.validator,
    this.labelText,
    this.borderType,
  }) : super(key: key);

  final InputBorderType? borderType;

  /// Texto com instruções
  final String? labelText;

  /// Limite inferior no calendário, datas anteriores serão inativas
  final DateTime firstDate;

  /// Limite superior no calendário, datas posteriores serão inativas
  final DateTime lastDate;

  /// Intervalo selecionado ao abrir o calendário.
  /// Seus extremos obrigatoriamente está contido entre [firstDate] e [lastDate].
  final DateTimeRange initialDateRange;

  /// Função de validação
  final String? Function(DateTimeRange?)? validator;

  /// Chamada quando um intervalo válido é selecionado
  final void Function(DateTimeRange?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTimeRange>(
      onSaved: onSaved,
      validator: validator,
      builder: (FormFieldState<DateTimeRange> state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateRangePicker(
            labelText: labelText,
            firstDate: firstDate,
            lastDate: lastDate,
            initialDateRange: initialDateRange,
            borderType: borderType,
            onPicked: (dateTimeRange) {
              state.didChange(dateTimeRange);
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
    );
  }
}
