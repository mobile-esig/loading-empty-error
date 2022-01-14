import 'package:flutter/material.dart';
import '../texto_separado.dart';
import 'date_time_ext.dart';

extension DateTimeRangeExtension on DateTimeRange {
  bool get intervaloDeUmDia => start.equalDate(end);

  /// Retorna intervalo formatado com datas inicial e final separadas por [separador]
  String formattedDateRange([String separadador = ' à ']) {
    if (intervaloDeUmDia) {
      return start.formattedDate();
    } else {
      return textoSeparado(
        start.formattedDate(),
        end.formattedDate(),
        separadador,
      );
    }
  }
}
