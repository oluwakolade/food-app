class BbqModel {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final MeatCategory category;

  BbqModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
  });
}

enum MeatCategory {
  steak,
  chicken,
  turkey,
  sides,
}
