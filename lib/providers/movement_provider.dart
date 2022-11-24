import 'package:balance_app/models/movement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovementProvider extends ChangeNotifier {
  List<Movement> movements = [];
  num balance = 0;
  List<String> movementTypes = ['income', 'expense'];
  String selectedType = 'income';
  void addMovement(title, amount, description) {
    Movement movement = Movement(
      id: DateTime.now().toString(),
      title: title,
      amount: double.parse(amount),
      description: description,
      type: selectedType,
      createdAt: DateFormat.yMd().add_jm().format(DateTime.now()),
    );
    movements.insert(0, movement);
    getBalance();
    notifyListeners();
  }

  void removeMovement(index) {
    movements.removeWhere((element) => element.id == index);
    notifyListeners();
  }

  setMovementType(String? type) {
    selectedType = type ?? selectedType;
    notifyListeners();
  }

  num getBalance() {
    if (movements.isNotEmpty) {
      balance = movements
          .map((e) => e.type == 'expense' ? e.amount * -1 : e.amount)
          .reduce((prev, current) => prev + current);
    }
    if (movements.isEmpty) {
      balance = 0;
    }
    notifyListeners();
    return balance;
  }
}
