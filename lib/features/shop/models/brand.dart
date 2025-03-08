import 'package:cloud_firestore/cloud_firestore.dart';

class Brand {
  final String id;
  final String name;
  final String icon;
  final bool isVerified;
  final int noProducts;

  Brand(
      {required this.id,
      required this.name,
      required this.icon,
      required this.isVerified,
      required this.noProducts});

  static Brand empty() {
    return Brand(id: '', name: '', icon: '', isVerified: false, noProducts: 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'isVerified': isVerified,
      'noProducts': noProducts,
    };
  }

  factory Brand.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() == null) {
      return Brand.empty();
    }
    final json = doc.data()!;
    return Brand(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      isVerified: json['isVerified'],
      noProducts: json['noProducts'],
    );
  }
}
