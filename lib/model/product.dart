class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.venueId,
    required this.status,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map json) => Product(
        id: json['id'],
        title: json['name_en'],
        description: json['description'] ?? '',
        venueId: json['institution'],
        status: json['status'],
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        imageUrl: json['image'],
      );

  final int id;
  final String title;
  final String description;
  final int venueId;
  final String status;
  final double price;
  final String imageUrl;

  Product copyWith(
    int? id,
    String? title,
    String? description,
    int? venueId,
    String? status,
    double? price,
    String? imageUrl,
  ) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        venueId: venueId ?? this.venueId,
        status: status ?? this.status,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'institution': venueId,
        'status': status,
        'price': price,
        'url': imageUrl,
      };

  @override
  bool operator ==(Object other) =>
      other is Product &&
      other.runtimeType == runtimeType &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.venueId == venueId &&
      other.status == status &&
      other.price == price &&
      other.imageUrl == imageUrl;

  @override
  int get hashCode => Object.hash(this, id, title, description, venueId, status, price, imageUrl);
}
