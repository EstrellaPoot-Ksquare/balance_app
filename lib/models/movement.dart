enum MovementType { income, expense }

class Movement {
  String? id;
  String title;
  double amount;
  String description;
  String type;
  String createdAt;

  Movement({
    required this.title,
    required this.amount,
    required this.description,
    required this.type,
    required this.createdAt,
    this.id,
  });
}
