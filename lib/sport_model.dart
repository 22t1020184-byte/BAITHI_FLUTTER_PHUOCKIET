// sport_model.dart
class Sport {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final int popularity;
  final List<String> benefits;
  final String rules;
  final String equipment;

  Sport({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.popularity,
    required this.benefits,
    required this.rules,
    required this.equipment,
  });
}