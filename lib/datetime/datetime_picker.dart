import 'package:flutter/material.dart';
import 'package:loading_empty_error/utils/enums/input_border_enum.dart';
import 'package:loading_empty_error/utils/extensions/date_time_ext.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    this.onPicked,
    required this.firstDate,
    this.initialDate,
    required this.lastDate,
    this.labelText,
    this.borderType,
  }) : super(key: key);

  final InputBorderType? borderType;

  /// Limite inferior no calendário, datas anteriores serão inativas
  final DateTime firstDate;

  /// Primeira data selecionada ao abrir o calendário. Obrigatoriamente está entre [firstDate] e [lastDate]
  final DateTime? initialDate;

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
  /// DateTime(0) representa uma data nula, quando não é passado em [initialDate]
  final _nullValue = DateTime(0);

  late var _picked = widget.initialDate ?? _nullValue;
  late final _dateCtrl = TextEditingController(text: _picked.string);

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
            _picked = d;
            _dateCtrl.text = _picked.string;
          });
          widget.onPicked?.call(_picked);
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
      initialDate:
          _picked == _nullValue ? widget.lastDate.truncateFuture : _picked,
      lastDate: widget.lastDate,
    );
  }

  void _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

// Fonte do widget: https://www.refactord.com/guides/flutter-text-field-date-picker