class Recipe {
  final int? id;
  final String title;
  final String description;

  Recipe({this.id, required this.title, required this.description});

  factory Recipe.fromMap(Map m) => Recipe(
    id: m['id'] as int?,
    title: m['title'] as String,
    description: m['description'] as String,
  );

  Map toMap() => {
    'id': id, 'title': title, 'description': description,
  };
}