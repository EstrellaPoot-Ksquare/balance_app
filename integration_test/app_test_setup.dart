import 'package:balance_app/constants/constants.dart';
import 'package:balance_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

class AppTestSetup {
  Future<void> movementTest({
    required WidgetTester tester,
    required String type,
    required String titleText,
    required String amountText,
    required String descText,
    required Finder typeRB,
    required Finder titleTextField,
    required Finder amountTextField,
    required Finder descTextField,
    required Finder goCreateMoveEB,
    required Finder createMovementEB,
    required Finder goDetailMoveInk,
    required Finder deleteEB,
  }) async {
    String sign = '+';
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(goCreateMoveEB);
    await tester.pumpAndSettle();

    await tester.tap(typeRB);
    await tester.enterText(titleTextField, titleText);
    await tester.enterText(amountTextField, amountText);
    await tester.enterText(descTextField, descText);
    await tester.tap(createMovementEB);
    await tester.pumpAndSettle();
    if (type == 'expense') {
      sign = '-';
      expect(
          find.text('\$ -${double.tryParse(amountText)} USD'), findsOneWidget);
    } else {
      expect(
          find.text('\$ ${double.tryParse(amountText)} USD'), findsOneWidget);
    }
    expect(find.text(titleText), findsOneWidget);
    expect(find.text('$sign ${double.tryParse(amountText)}'), findsOneWidget);

    await tester.tap(goDetailMoveInk);
    await tester.pumpAndSettle();
    expect(find.text(titleText), findsOneWidget);
    await tester.tap(deleteEB);
    await tester.pumpAndSettle();
    expect(find.text(AppString.noDataFound), findsOneWidget);
  }
}
