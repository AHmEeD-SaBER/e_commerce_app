import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;
  final List<dynamic> images;
  final bool isFeatured;
  final Map<String, List<Map<String, dynamic>>> attributes;
  final String categoryId;
  final String brandId;
  final double sale;
  final double rating;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.thumbnail,
      required this.images,
      required this.isFeatured,
      required this.attributes,
      required this.categoryId,
      required this.brandId,
      required this.sale,
      required this.rating});

  static Product empty() {
    return Product(
        id: '',
        title: '',
        description: '',
        price: 0.0,
        thumbnail: '',
        images: [],
        isFeatured: false,
        attributes: {},
        categoryId: '',
        brandId: '',
        sale: 0.0,
        rating: 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'thumbnail': thumbnail,
      'images': images,
      'isFeatured': isFeatured,
      'attributes': attributes,
      'categoryId': categoryId,
      'brandId': brandId,
      'sale': sale,
      'rating': rating
    };
  }

  factory Product.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() == null) {
      return Product.empty();
    }
    final json = doc.data()!;
    return Product(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        price: (json['price'] ?? 0.0).toDouble(),
        thumbnail: json['thumbnail'] ?? '',
        // Fix the list casting
        images: (json['images'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        isFeatured: json['isFeatured'] ?? false,
        // Updated attributes casting to handle the new structure
        attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(
                key,
                (value as List<dynamic>)
                    .map((item) => (item as Map<String, dynamic>))
                    .toList(),
              ),
            ) ??
            {},
        categoryId: json['categoryId'] ?? '',
        brandId: json['brandId'] ?? '',
        sale: (json['sale'] ?? 0.0).toDouble(),
        rating: (json['rating'] ?? 0.0).toDouble());
  }
}
