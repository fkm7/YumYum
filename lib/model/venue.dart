import 'package:delmer/model/address.dart';

class Venue {
  Venue({
    required this.address,
    required this.category,
    required this.deliveryCost,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.logoUrl,
    required this.isLiked,
    required this.isOpen,
    required this.title,
    required this.rating,
    required this.startTime,
    required this.closingTime,
    required this.phoneNumber,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.freeDeliveryFrom,
  });

  factory Venue.fromJson(Map data) => Venue(
        address: Address.fromJson(data['address']),
        category: data['category'],
        deliveryCost: double.tryParse(data['delivery_cost'].toString()),
        description: data['description'],
        id: data['id'],
        imageUrl: data['image'],
        logoUrl: data['logo'],
        isLiked: data['is_liked'],
        isOpen: data['is_open'],
        title: data['name'],
        rating: double.tryParse(data['rating'].toString()),
        startTime: data['start_time'],
        closingTime: data['end_time'],
        phoneNumber: data['phone_number'],
        minDeliveryTime: data['min_delivery_time'],
        maxDeliveryTime: data['max_delivery_time'],
        freeDeliveryFrom: double.tryParse(data['free_delivery_from'].toString()),
      );

  final Address address;
  final int category;
  final double? deliveryCost;
  final String? description;
  final int id;
  final String imageUrl;
  final String logoUrl;
  final bool isLiked;
  final bool isOpen;
  final String title;
  final double? rating;
  final String startTime;
  final String closingTime;
  final String phoneNumber;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final double? freeDeliveryFrom;

  Venue copyWith(
    int? id,
    String? title,
    int? category,
    bool? isOpen,
    bool? isLiked,
    double? rating,
    String? logoUrl,
    String? imageUrl,
    Address? address,
    String? startTime,
    double? deliveryCost,
    String? description,
    String? closingTime,
    String? phoneNumber,
    int? minDeliveryTime,
    int? maxDeliveryTime,
    double? freeDeliveryFrom,
  ) =>
      Venue(
        id: id ?? this.id,
        title: title ?? this.title,
        address: address ?? this.address,
        category: category ?? this.category,
        deliveryCost: deliveryCost ?? this.deliveryCost,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        logoUrl: logoUrl ?? this.logoUrl,
        isLiked: isLiked ?? this.isLiked,
        isOpen: isOpen ?? this.isOpen,
        rating: rating ?? this.rating,
        startTime: startTime ?? this.startTime,
        closingTime: closingTime ?? this.closingTime,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        minDeliveryTime: minDeliveryTime ?? this.minDeliveryTime,
        maxDeliveryTime: maxDeliveryTime ?? this.maxDeliveryTime,
        freeDeliveryFrom: freeDeliveryFrom ?? this.freeDeliveryFrom,
      );

  Map toJson() => {
        'address': address.toJson(),
        'category': category,
        'delivery_cost': deliveryCost,
        'description': description,
        'id': id,
        'image_url': imageUrl,
        'logo_url': logoUrl,
        'is_open': isOpen,
        'name': title,
        'rating': rating,
        'start_time': startTime,
        'end_time': closingTime,
        'phone_number': phoneNumber,
        'min_delivery_time': minDeliveryTime,
        'max_delivery_time': maxDeliveryTime,
        'free_delivery_from': freeDeliveryFrom,
      };

  @override
  bool operator ==(Object other) =>
      other is Venue &&
        other.runtimeType == runtimeType &&
        other.address == address &&
        other.category == category &&
        other.deliveryCost == deliveryCost &&
        other.description == description &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.logoUrl == logoUrl &&
        other.isOpen == isOpen &&
      other.title == title &&
        other.rating == rating &&
        other.startTime == startTime &&
        other.closingTime == closingTime &&
        other.phoneNumber == phoneNumber &&
        other.maxDeliveryTime == maxDeliveryTime &&
        other.minDeliveryTime == minDeliveryTime &&
      other.freeDeliveryFrom == freeDeliveryFrom;

  @override
  int get hashCode => Object.hash(
      this,
      address,
      category,
      deliveryCost,
      description,
      id.hashCode,
      imageUrl,
      logoUrl,
      isOpen,
      title,
      rating,
      startTime,
      closingTime,
      phoneNumber,
      minDeliveryTime,
      maxDeliveryTime,
      freeDeliveryFrom,);
}
