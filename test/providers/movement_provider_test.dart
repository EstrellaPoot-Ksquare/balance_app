import 'package:balance_app/providers/movement_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MovementProvider movementProvider;
  setUp(() {
    movementProvider = MovementProvider();
  });
  group(
    "Movements",
    () {
      test("Movement list must be empty", () {
        expect(movementProvider.movements.length, 0);
        expect(movementProvider.getBalance(), 0);
        expect(movementProvider.balance, 0);
      });
      test("Add New Income", () {
        movementProvider.setMovementType('income');
        movementProvider.addMovement("Salary", '1000', 'My salary');
        expect(movementProvider.movements.length, 1);
        expect(movementProvider.getBalance(), 1000);
        expect(movementProvider.balance, 1000);
      });
      test("Add and remove New Income", () {
        movementProvider.setMovementType('income');
        movementProvider.addMovement("Salary", '1000', 'My salary');
        movementProvider.removeMovement(movementProvider.movements[0].id);
        expect(movementProvider.movements.length, 0);
        expect(movementProvider.getBalance(), 0);
        expect(movementProvider.balance, 0);
      });

      test("Add New Expense", () {
        movementProvider.setMovementType('expense');
        movementProvider.addMovement("Movie Ticket", '100', 'Movie Ticket');
        expect(movementProvider.movements.length, 1);
        expect(movementProvider.getBalance(), -100);
        expect(movementProvider.balance, -100);
      });

      test("Add and remove New expense", () {
        movementProvider.setMovementType('expense');
        movementProvider.addMovement("Movie Ticket", '100', 'Movie Ticket');
        movementProvider.removeMovement(movementProvider.movements[0].id);
        expect(movementProvider.movements.length, 0);
        expect(movementProvider.getBalance(), 0);
        expect(movementProvider.balance, 0);
      });

      test("Add Both New Income and Expense", () {
        movementProvider.setMovementType('income');
        movementProvider.addMovement("Salary", '1000', 'My salary');
        movementProvider.setMovementType('expense');
        movementProvider.addMovement("Movie Ticket", '100', 'Movie Ticket');
        expect(movementProvider.movements.length, 2);
        expect(movementProvider.getBalance(), 900);
        expect(movementProvider.balance, 900);
      });

      test("Add and Delete Both New Income and Expense", () {
        movementProvider.setMovementType('income');
        movementProvider.addMovement("Salary", '1000', 'My salary');
        movementProvider.setMovementType('expense');
        movementProvider.addMovement("Movie Ticket", '100', 'Movie Ticket');
        movementProvider.removeMovement(movementProvider.movements[0].id);
        movementProvider.removeMovement(movementProvider.movements[0].id);
        expect(movementProvider.movements.length, 0);
        expect(movementProvider.getBalance(), 0);
        expect(movementProvider.balance, 0);
      });
    },
  );
}
