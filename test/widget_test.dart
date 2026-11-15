import 'package:flutter_test/flutter_test.dart';
import 'package:athar_al_madina/main.dart';

void main() {
  testWidgets('Athar app test', (WidgetTester tester) async {
    await tester.pumpWidget(const AtharApp());

    expect(find.text('أثر المدينة'), findsOneWidget);
  });
}