import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String userName;
  final String productId;
  final String review;
  final String date;
  final Review? sellerReview;
  final int rating;

  Review({
    required this.id,
    required this.userName,
    required this.productId,
    required this.review,
    required this.rating,
    required this.date,
    this.sellerReview,
  });

  factory Review.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() == null) {
      return Review.empty();
    }
    final data = doc.data()!;
    return Review(
      id: doc.id,
      userName: data['userName'] ?? 'Unknown User',
      productId: data['productId'] ?? '',
      review: data['review'] ?? '',
      rating: data['rating'] ?? 0,
      date: data['date'] ?? '',
      sellerReview: data['sellerReview'] != null
          ? Review(
              id: data['sellerReview']['id'] ?? '',
              userName: data['sellerReview']['userName'] ?? 'Unknown User',
              productId: data['sellerReview']['productId'] ?? '',
              review: data['sellerReview']['review'] ?? '',
              rating: data['sellerReview']['rating'] ?? 0,
              date: data['sellerReview']['date'] ?? '',
              sellerReview: null, // Prevent infinite nesting
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'productId': productId,
      'review': review,
      'rating': rating,
      'date': date,
      'sellerReview':
          sellerReview?.toJson(), // Convert sellerReview to JSON if it exists
    };
  }

  static Review empty() {
    return Review(
      id: '',
      userName: '',
      productId: '',
      review: '',
      rating: 0,
      date: '',
      sellerReview: null,
    );
  }
}
