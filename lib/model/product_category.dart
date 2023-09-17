class ProductCategory {
  ProductCategory({
    required this.id,
    required this.title,
    // required this.imageUrl,
  });

  factory ProductCategory.fromJson(Map json) {
    return ProductCategory(
      id: json['id'],
      title: json['name_en'],
      // imageUrl: json['icon'],
    );
  }

  final int id;
  final String title;
  // final String imageUrl;

  ProductCategory copyWith(
    int? id,
    String? title,
    String? imageUrl,
  ) =>
      ProductCategory(
        id: id ?? this.id,
        title: title ?? this.title,
        // imageUrl: imageUrl ?? this.imageUrl,
      );

  Map toJson() => {
        'id': id,
        'title': title,
        // 'imageUrl': imageUrl,
      };

  @override
  bool operator ==(Object other) {
    return other is ProductCategory &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title;
    // &&other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => Object.hash(
        this,
        id,
        title,
        // imageUrl,
      );
}
