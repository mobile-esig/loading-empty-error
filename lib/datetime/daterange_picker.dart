import 'package:flutter/material.dart';
import '../utils/extensions/date_time_range_ext.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    Key? key,
    this.onPicked,
    required this.firstDate,
    required this.lastDate,
    this.labelText,
    required this.initialDateRange,
  }) : super(key: key);

  /// Limite inferior no calendário, datas anteriores serão inativas
  final DateTime firstDate;

  /// Limite superior no calendário, datas posteriores serão inativas
  final DateTime lastDate;

  /// Intervalo selecionado ao abrir o calendário.
  /// Seus extremos obrigatoriamente estão entre [firstDate] e [lastDate]
  final DateTimeRange initialDateRange;

  /// Chamada quando um intervalo é selecionado
  final void Function(DateTimeRange?)? onPicked;

  final String? labelText;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  late var picked = widget.initialDateRange;
  late final _dateCtrl = TextEditingController(
    text: _dateRangeToString(picked),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());

        DateTimeRange? d = await _selectInterval(context);
        if (d != null) {
          setState(() {
            picked = d;
            _dateCtrl.text = _dateRangeToString(picked);
          });
          widget.onPicked?.call(picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateCtrl,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: widget.labelText ?? 'Escolha um período',
          ),
        ),
      ),
    );
  }

  Future<DateTimeRange?> _selectInterval(BuildContext context) async {
    return await showDateRangePicker(
      context: context,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      initialDateRange: widget.initialDateRange,
    );
  }

  String _dateRangeToString(DateTimeRange range) => range.formattedDateRange();
}

// Fonte do widget: https://www.refactord.com/guides/flutter-text-field-date-picker
