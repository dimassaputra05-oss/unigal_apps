
class ItemModel {
  final String id;
  final String title;
  final String description;

  const ItemModel({
    required this.id,
    required this.title,
    required this.description,
  });

  ItemModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return ItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
