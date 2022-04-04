import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading_empty_error/container.dart';

main() {
  late Widget widget;

  testWidgets('EsigContainer', (WidgetTester tester) async {
    const corFundo = Colors.red;
    const corBorda = Colors.blue;
    const child = Text('Olá mundo');
    const esigContainer = EsigContainerWidget(
      child: child,
      corBorda: corBorda,
      corFundo: corFundo,
    );
    widget = MaterialApp(
      home: Material(
        child: esigContainer,
      ),
    );

    await tester.pumpWidget(widget);

    /// Existe um widget do tipo EsigContainerWidget
    expect(find.byType(EsigContainerWidget), findsOneWidget);

    /// Existe um widget com o texto abaixo
    expect(find.text('Olá mundo'), findsOneWidget);

    /// O EsigContainerWidget é ancestral do child
    expect(
        find.ancestor(
          of: find.byWidget(child),
          matching: find.byType(EsigContainerWidget),
        ),
        findsOneWidget);

    /// Valor padrão do padding
    expect(
      tester.widget<Container>(find.byType(Container)).padding,
      EdgeInsets.symmetric(horizontal: 15, vertical: 9),
    );

    /// Valor padrão do margin
    expect(
      tester.widget<Container>(find.byType(Container)).margin,
      EdgeInsets.zero,
    );

    /// Valores do decoration
    expect(
      tester.widget<Container>(find.byType(Container)).decoration,
      BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          width: 1,
          color: corBorda,
        ),
      ),
    );
  });
}
