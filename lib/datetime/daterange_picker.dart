import 'package:flutter/material.dart';
import 'package:loading_empty_error/utils/enums/input_border_enum.dart';
import '../utils/extensions/date_time_range_ext.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    Key? key,
    this.onPicked,
    required this.firstDate,
    required this.lastDate,
    required this.initialDateRange,
    this.labelText,
    this.borderType,
  }) : super(key: key);

  final InputBorderType? borderType;

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
  late final InputBorder _border;

  @override
  void initState() {
    switch (widget.borderType) {
      case InputBorderType.NONE:
        _border = InputBorder.none;
        break;
      case InputBorderType.UNDERLINE:
        _border = UnderlineInputBorder();
        break;
      case InputBorderType.OUTLINED:
      default:
        _border = OutlineInputBorder(borderRadius: BorderRadius.circular(5));
    }
    super.initState();
  }

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
            border: _border,
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
