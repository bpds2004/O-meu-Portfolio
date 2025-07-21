// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:medtech/main.dart';

void main() {
  testWidgets('HomePage displays welcome text and buttons', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the welcome text is displayed.
    expect(find.text('Bem-vindo à Clínica MedTech!'), findsOneWidget);

    // Verify the buttons are displayed.
    expect(find.text('Ver Serviços'), findsOneWidget);
    expect(find.text('Contate-nos'), findsOneWidget);
  });

  testWidgets('Navigates to ServicosPage when "Ver Serviços" is tapped', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the "Ver Serviços" button.
    await tester.tap(find.text('Ver Serviços'));
    await tester.pumpAndSettle();

    // Verify the ServicosPage is displayed.
    expect(find.text('Aqui estão os serviços oferecidos pela Clínica MedTech.'), findsOneWidget);
  });

  testWidgets('Navigates to ContatoPage when "Contate-nos" is tapped', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the "Contate-nos" button.
    await tester.tap(find.text('Contate-nos'));
    await tester.pumpAndSettle();

    // Verify the ContatoPage is displayed.
    expect(find.text('Entre em contato conosco pelo telefone ou e-mail.'), findsOneWidget);
  });
}
