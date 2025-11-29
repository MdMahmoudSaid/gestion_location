class Maison {
  final int id;
  final String localisation;
  final String prix;
  final String description;
  final double altitude;
  final double longitude;
  final List<String> images;
  final int userId;

  Maison({
    required this.id,
    required this.localisation,
    required this.prix,
    required this.description,
    required this.altitude,
    required this.longitude,
    required this.images,
    required this.userId,
  });

  factory Maison.fromJson(Map<String, dynamic> json) {
    List<String> imageList = [];
    if (json['images'] != null) {
      if (json['images'] is List) {
        imageList = List<String>.from(json['images']);
      } else if (json['images'] is String) {
        imageList = [json['images']];
      }
    }

    return Maison(
      id: json['id'] ?? 0,
      localisation: json['localisation'] ?? '',
      prix: json['prix']?.toString() ?? '0',
      description: json['description'] ?? '',
      altitude: (json['altitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      images: imageList,
      userId: json['userId'] ?? json['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'localisation': localisation,
      'prix': prix,
      'description': description,
      'altitude': altitude,
      'longitude': longitude,
      'images': images,
      'userId': userId,
    };
  }
}
