// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading_empty_error/loading_indicator_type.dart';
import 'package:loading_empty_error/loading_widget.dart';

void main() {
  late Widget widget;

  testWidgets('EsigLoadingWidget', (WidgetTester tester) async {
    widget = MaterialApp(
      home: EsigLoadingWidget(
        'Carregando...',
        paddingIndicator: EdgeInsets.all(20),
        loadingIndicator: LoadingIndicator.LINEAR,
        mensagemFontSize: 16,
        largura: 100,
        altura: 100,
      ),
    );

    await tester.pumpWidget(widget);

    // ensures this is the right widget
    expect(find.byType(EsigLoadingWidget), findsOneWidget);

    // should show correct text
    expect(find.text('Carregando...'), findsOneWidget);

    // should show correct progress indicator
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // should have a padding
    expect(find.byType(Padding), findsOneWidget);
  });
}
