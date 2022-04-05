import 'int_ext.dart';

extension DateTimeExtension on DateTime {
  String get string => year == 0 ? '' : formattedDate();

  /// Compara igualdade entre dois [DateTime] desconsiderando tempo
  bool equalDate(DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  /// Retorna String com data formatada.
  /// É possível configurar o caractere separador.
  String formattedDate([String separator = '/']) =>
      '${day.pad}$separator${month.pad}$separator$year';

  /// Remove informação de hora, minuto, segundo e milisegundo
  /// Retorna o mesmo DateTime com somente ano, mês e dia
  DateTime get horaInicial => DateTime(year, month, day);

  /// Retorna o mesmo [this] se estiver numa data passada.
  /// Retorna DateTime.now() se [this] for uma data futura.
  /// Cálculo não considera informações de hora, minuto e segundo.
  DateTime get truncateFuture {
    final now = DateTime.now().horaInicial;
    if (horaInicial.isAfter(now)) {
      return now;
    }
    return this;
  }
}
