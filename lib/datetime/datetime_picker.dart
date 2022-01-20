import 'package:flutter/material.dart';
import 'package:loading_empty_error/utils/enums/input_border_enum.dart';
import 'package:loading_empty_error/utils/extensions/date_time_ext.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    this.onPicked,
    required this.firstDate,
    required this.initialDate,
    required this.lastDate,
    this.labelText,
    this.borderType,
  }) : super(key: key);

  final InputBorderType? borderType;

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
            border: _border,
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