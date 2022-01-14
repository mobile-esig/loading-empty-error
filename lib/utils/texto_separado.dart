/// Retorna String "[s1][separador][s2]", quando [s1] e [s2] são não nulos.
/// Retorna somente uma das Strings quando a outra for nula.
String textoSeparado(String? s1, String? s2, String? separador) {
  if (s1 != null && s2 != null && separador != null) {
    return s1 + separador + s2;
  }
  if (s1 != null) return s1;
  if (s2 != null) return s2;
  return '';
}
