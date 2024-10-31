class DonateModel {
  final String? id;
  final String category;
  final String description;
  final String quantity;

  const DonateModel({
    this.id,
    required this.category,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "description": description,
      "quantity": quantity,
    };
  }
}
