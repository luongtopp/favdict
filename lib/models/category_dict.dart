class Category {
  final String categoryId;
  final String categoryName;

  const Category({
    required this.categoryId,
    required this.categoryName,
  });
  Map<String, dynamic> toMap() {
    return {
      'catefory_id': categoryId,
      'category_name': categoryName,
    };
  }

  @override
  String toString() {
    return '''Category{categoryId: $categoryId, 
      categoryName: $categoryName}''';
  }
}
