class FoodDrinkModel {
  final int id;
  final String imagePath;
  final String name;
  final String description;
  final num price;
  final num categoreyId;
  int itemCounter;
  FoodDrinkModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.categoreyId,
    this.itemCounter = 0,
  });
  factory FoodDrinkModel.fromJson(Map<String, dynamic> json) {
    return FoodDrinkModel(
        id: json['id'],
        imagePath: json['imagePath'],
        name: json['name'],
        description: json['description'],
        categoreyId: json['categoreyId'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imagePath'] = imagePath;
    data['name'] = name;
    data['description'] = description;
    data['categoreyId'] = categoreyId;
    data['price'] = price;

    return data;
  }
}
