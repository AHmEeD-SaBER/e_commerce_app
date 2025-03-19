import 'package:e_commerce_app/data/repos/products/reviews_repo.dart';
import 'package:e_commerce_app/features/shop/models/review.dart';
import 'package:e_commerce_app/utils/constants/dummy_reviews.dart';
import 'package:get/get.dart';

class ReviewsController extends GetxController {
  static ReviewsController get instance => Get.find();
  final ReviewsRepo _reviewsRepo = Get.put(ReviewsRepo());
  final RxMap<int, int> ratingMap = <int, int>{}.obs;
  final RxList<Review> reviews = <Review>[].obs;
  final isLoading = true.obs;

  Future<void> addReview(Review review) async {
    await _reviewsRepo.addReview(review);
    reviews.add(review);
  }

  Future<void> updateReview(Review review) async {
    await _reviewsRepo.updateReview(review);
  }

  Future<void> getReviews(String productId) async {
    try {
      isLoading.value = true;
      // For demo purposes, filter from dummy reviews
      final productReviews = dummyReviews
          .where((review) => review.productId == productId)
          .toList();
      reviews.assignAll(productReviews);
    } finally {
      isLoading.value = false;
    }
  }

  double getTotalRating(String productId) {
    final productReviews =
        reviews.where((review) => review.productId == productId).toList();
    if (productReviews.isEmpty) return 0;
    final totalRating =
        productReviews.fold(0, (sum, review) => sum + review.rating);
    return totalRating / productReviews.length;
  }

  void getRatingMap() {
    for (int i = 1; i <= 5; i++) {
      ratingMap[i] = reviews.where((review) => review.rating == i).length;
    }
  }

  int getTotalReviews(String productId) {
    return reviews.where((review) => review.productId == productId).length;
  }
}
