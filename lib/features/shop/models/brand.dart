import 'package:cloud_firestore/cloud_firestore.dart';

class Brand {
  final String id;
  final String name;
  final String icon;
  final bool isVerified;
  final int noProducts;
  final bool isFeatured;
  final List<String> categoryId;

  Brand(
      {required this.id,
      required this.name,
      required this.icon,
      required this.isVerified,
      required this.noProducts,
      required this.isFeatured,
      required this.categoryId});

  static Brand empty() {
    return Brand(
        id: '',
        name: '',
        icon: '',
        isVerified: false,
        noProducts: 0,
        isFeatured: false,
        categoryId: []);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'isVerified': isVerified,
      'noProducts': noProducts,
      'isFeatured': isFeatured,
      'categoryId': categoryId,
    };
  }

  factory Brand.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() == null) {
      return Brand.empty();
    }
    final json = doc.data()!;
    return Brand(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      isVerified: json['isVerified'] ?? false,
      noProducts: json['noProducts'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      categoryId: json['categoryId'] != null
          ? List<String>.from(json['categoryId'])
          : [],
    );
  }
}
