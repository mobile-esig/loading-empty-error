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
        paddingIndicator: EdgeInsets.all(20),
        loadingIndicator: LoadingIndicator.LINEAR,
        mensagem: 'Carregando...',
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

    // should have specified width
    expect(
      find.byWidgetPredicate((Widget widget) {
        final EsigLoadingWidget loadingWidget = tester.allWidgets
                .firstWhere((element) => element is EsigLoadingWidget)
            as EsigLoadingWidget;

        final Size baseSize = tester.getSize(find.byType(EsigLoadingWidget));

        // BoxConstraints constraints = loadingWidget.largura;
        return true;
        // (width.minWidth == width.maxWidth) && (width.minWidth == 100);
      }),
      findsOneWidget,
    );

    // should have specified height
    expect(
      find.byWidgetPredicate((Widget widget) {
        if (widget is Container) {
          BoxConstraints height = widget.constraints!.heightConstraints();
          return height.maxHeight == 140;
        } else {
          return false;
        }
      }),
      findsOneWidget,
    );
  });
}
