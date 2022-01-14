import 'int_ext.dart';

extension DateTimeExtension on DateTime {
  /// Compara igualdade entre dois [DateTime] desconsiderando tempo
  bool equalDate(DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  /// Retorna String com data formatada.
  /// É possível configurar o caractere separador.
  String formattedDate([String separator = '/']) =>
      '${day.pad}$separator${month.pad}$separator$year';
}
