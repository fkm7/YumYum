class Address {
  Address({
    this.title = '',
    required this.latitude,
    required this.longitude,
    required this.street,
    required this.city,
    required this.country,
  });

  factory Address.fromJson(Map json) => Address(
        latitude: double.tryParse(json['latitude']),
        longitude: double.tryParse(json['longitude']),
        street: json['street'],
        city: json['city'],
        country: json['country'],
      );

  final String title;
  final double? latitude;
  final double? longitude;
  final String? street;
  final String? city;
  final String? country;

  Address copyWith(
    double? latitude,
    double? longitude,
    String? street,
    String? city,
    String? country,
  ) =>
      Address(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        street: street ?? this.street,
        city: city ?? this.city,
        country: country ?? this.country,
      );

  Map toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'street': street,
        'city': city,
        'country': country,
      };

  @override
  bool operator ==(Object other) =>
      other is Address &&
      other.runtimeType == runtimeType &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.street == street &&
      other.city == city &&
      other.country == country;

  @override
  int get hashCode => Object.hash(this, latitude, longitude, street, city, country);
}
