extension IntExtension on int {
  /// Formata valores para terem pelo menos 2 dígitos.
  String get pad => this < 10 ? '0' + toString() : toString();
}
