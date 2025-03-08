import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String id;
  String name;
  String image;
  bool isFeatured;
  String parentId;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  static Category empty() => Category(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'isFeatured': isFeatured,
        'parentId': parentId,
      };

  factory Category.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null) {
      final json = doc.data()!;
      return Category(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        image: json['image'] ?? '',
        isFeatured: json['isFeatured'] ?? false,
        parentId: json['parentId'] ?? '',
      );
    } else {
      return Category.empty();
    }
  }
}
