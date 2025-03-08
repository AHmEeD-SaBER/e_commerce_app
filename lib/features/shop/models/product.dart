import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;
  final List<dynamic> images;
  final bool isFavorite;
  final bool isFeatured;
  final Map<String, List<dynamic>> attributes;
  final String categoryId;
  final String brandId;
  final double sale;
  final int stock;
  final double rating;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.thumbnail,
      required this.images,
      required this.isFavorite,
      required this.isFeatured,
      required this.attributes,
      required this.categoryId,
      required this.brandId,
      required this.sale,
      required this.stock,
      required this.rating});

  static Product empty() {
    return Product(
        id: '',
        title: '',
        description: '',
        price: 0.0,
        thumbnail: '',
        images: [],
        isFavorite: false,
        isFeatured: false,
        attributes: {},
        categoryId: '',
        brandId: '',
        sale: 0.0,
        stock: 0,
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
      'isFav': isFavorite,
      'isFeatured': isFeatured,
      'attributes': attributes,
      'categoryId': categoryId,
      'brandId': brandId,
      'sale': sale,
      'stock': stock,
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
        isFavorite: json['isFav'] ?? false,
        isFeatured: json['isFeatured'] ?? false,
        // Fix the attributes map casting
        attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(
                key,
                (value as List<dynamic>).map((e) => e.toString()).toList(),
              ),
            ) ??
            {},
        categoryId: json['categoryId'] ?? '',
        brandId: json['brandId'] ?? '',
        sale: (json['sale'] ?? 0.0).toDouble(),
        stock: (json['stock'] ?? 0).toInt(),
        rating: (json['rating'] ?? 0.0).toDouble());
  }
}
