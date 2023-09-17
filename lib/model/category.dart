class Category {
  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory Category.fromJson(Map json) {
    return Category(
      id: json['id'],
      title: json['title_en'],
      imageUrl: json['icon'],
    );
  }

  final int id;
  final String title;
  final String imageUrl;

  Category copyWith(
    int? id,
    String? title,
    String? imageUrl,
  ) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  Map toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
      };

  @override
  bool operator ==(Object other) {
    return other is Category &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => Object.hash(this, id, title, imageUrl);
}
