import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'app_test_setup.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Finder incomeRB;
  late Finder expenseRB;

  late Finder titleTextField;
  late Finder amountTextField;
  late Finder descTextField;

  late Finder goCreateMoveEB;
  late Finder createMovementEB;

  late Finder goDetailMoveInk;
  late Finder deleteEB;

  setUp(() {
    incomeRB = find.byKey(const Key('incomeRB'));
    expenseRB = find.byKey(const Key('expenseRB'));

    titleTextField = find.byKey(const Key('titleTextField'));
    amountTextField = find.byKey(const Key('amountTextField'));
    descTextField = find.byKey(const Key('descTextField'));

    goCreateMoveEB = find.byKey(const Key('goCreateMoveEB'));
    createMovementEB = find.byKey(const Key('createMovementEB'));

    goDetailMoveInk = find.byKey(const Key('goDetailMoveInk_0'));
    deleteEB = find.byKey(const Key('deleteEB'));
  });
  group('end-to-end test', () {
    testWidgets(
      'Add income expense movements',
      (tester) async {
        await AppTestSetup().movementTest(
          tester: tester,
          type: 'income',
          titleText: 'Salary',
          amountText: '500',
          descText: 'My amazing salary',
          typeRB: incomeRB,
          titleTextField: titleTextField,
          amountTextField: amountTextField,
          descTextField: descTextField,
          goCreateMoveEB: goCreateMoveEB,
          createMovementEB: createMovementEB,
          goDetailMoveInk: goDetailMoveInk,
          deleteEB: deleteEB,
        );
      },
    );

    testWidgets('Add income expense movements', (tester) async {
      await AppTestSetup().movementTest(
        tester: tester,
        type: 'expense',
        titleText: 'Movie ticket',
        amountText: '100',
        descText: 'Ticket for Spiderman',
        typeRB: expenseRB,
        titleTextField: titleTextField,
        amountTextField: amountTextField,
        descTextField: descTextField,
        goCreateMoveEB: goCreateMoveEB,
        createMovementEB: createMovementEB,
        goDetailMoveInk: goDetailMoveInk,
        deleteEB: deleteEB,
      );
    });
  });
}
