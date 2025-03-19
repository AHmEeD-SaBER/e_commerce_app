import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/review.dart';
import 'package:e_commerce_app/utils/constants/dummy_reviews.dart';
import 'package:get/get.dart';

class ReviewsRepo extends GetxController {
  static ReviewsRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<void> addReview(Review review) async {
    await _db.collection('reviews').doc(review.id).set(review.toJson());
  }

  Future<void> updateReview(Review review) async {
    await _db.collection('reviews').doc(review.id).update(review.toJson());
  }

  Future<List<Review>> getReviews(String productId) async {
    final snapshot = await _db
        .collection('reviews')
        .where('productId', isEqualTo: productId)
        .get();
    return snapshot.docs.map((doc) => Review.fromJson(doc)).toList();
  }

  @override
  void onInit() async {
    super.onInit();
    for (final review in dummyReviews) {
      await _db.collection('reviews').doc(review.id).set(review.toJson());
    }
  }
}
