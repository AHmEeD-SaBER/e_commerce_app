import 'package:e_commerce_app/features/shop/models/review.dart';

final List<Review> dummyReviews = [
  // Reviews for Nike Air Jordan Collection
  Review(
    id: 'rev1',
    userName: 'John Doe',
    productId: 'nike-air-jordan-collection',
    review:
        'These shoes are amazing! The comfort level is outstanding and the design is just perfect.',
    rating: 5,
    date: '2024-03-15',
  ),
  Review(
    id: 'rev2',
    userName: 'Jane Smith',
    productId: 'nike-air-jordan-collection',
    review: 'Great quality and stylish design. Worth every penny!',
    rating: 4,
    date: '2024-03-14',
  ),
  Review(
    id: 'rev2_1',
    userName: 'Mike Johnson',
    productId: 'nike-air-jordan-collection',
    review:
        'The grip is exceptional, perfect for basketball. A bit pricey but worth it.',
    rating: 5,
    date: '2024-03-13',
  ),
  Review(
    id: 'rev2_2',
    userName: 'Sarah Wilson',
    productId: 'nike-air-jordan-collection',
    review:
        'Second pair I\'ve bought. These are even better than my first ones!',
    rating: 5,
    date: '2024-03-12',
  ),

  // Reviews for Acer Laptop Premium
  Review(
    id: 'rev3',
    userName: 'David Brown',
    productId: 'acer-laptop-premium',
    review:
        'Excellent performance for both work and gaming. Battery life could be better though.',
    rating: 4,
    date: '2024-03-13',
    sellerReview: Review(
      id: 'seller_rev1',
      userName: 'Acer Support',
      productId: 'acer-laptop-premium',
      review:
          'Thank you for your feedback! We\'re working on improving battery life in future models.',
      rating: 5,
      date: '2024-03-14',
    ),
  ),
  Review(
    id: 'rev3_1',
    userName: 'Emily Davis',
    productId: 'acer-laptop-premium',
    review:
        'Perfect for my coding needs. The screen is fantastic and keyboard is comfortable.',
    rating: 5,
    date: '2024-03-12',
  ),
  Review(
    id: 'rev3_2',
    userName: 'Alex Turner',
    productId: 'acer-laptop-premium',
    review: 'Great value for the specs. Runs all my software smoothly.',
    rating: 5,
    date: '2024-03-11',
  ),

  // Reviews for iPhone 12 Series
  Review(
    id: 'rev4',
    userName: 'Lisa Anderson',
    productId: 'iphone-12-series',
    review: 'The camera quality is exceptional! Love the new design.',
    rating: 5,
    date: '2024-03-12',
  ),
  Review(
    id: 'rev5',
    userName: 'Tom Wilson',
    productId: 'iphone-12-series',
    review: 'Great phone but battery drains quickly with 5G.',
    rating: 4,
    date: '2024-03-11',
    sellerReview: Review(
      id: 'seller_rev2',
      userName: 'Apple Support',
      productId: 'iphone-12-series',
      review:
          'Thank you for your feedback. We recommend adjusting 5G settings for optimal battery life.',
      rating: 5,
      date: '2024-03-12',
    ),
  ),
  Review(
    id: 'rev5_1',
    userName: 'Chris Martin',
    productId: 'iphone-12-series',
    review:
        'The MagSafe feature is a game changer! Charging is so convenient now.',
    rating: 5,
    date: '2024-03-10',
  ),
  Review(
    id: 'rev5_2',
    userName: 'Rachel Green',
    productId: 'iphone-12-series',
    review: 'Face ID works perfectly even with a mask on. Very impressed!',
    rating: 5,
    date: '2024-03-09',
  ),

  // Reviews for Premium Collar T-Shirt
  Review(
    id: 'rev6',
    userName: 'Monica Geller',
    productId: 'premium-collar-tshirt',
    review: 'Perfect fit and comfortable material. Colors are vibrant.',
    rating: 5,
    date: '2024-03-10',
  ),
  Review(
    id: 'rev6_1',
    userName: 'Ross Geller',
    productId: 'premium-collar-tshirt',
    review:
        'Bought in multiple colors. Great for both casual and semi-formal wear.',
    rating: 5,
    date: '2024-03-09',
  ),
  Review(
    id: 'rev6_2',
    userName: 'Chandler Bing',
    productId: 'premium-collar-tshirt',
    review: 'Nice material but sizing runs a bit large.',
    rating: 4,
    date: '2024-03-08',
  ),

  // Reviews for Premium Leather Jacket
  Review(
    id: 'rev7',
    userName: 'Joey Tribbiani',
    productId: 'premium-leather-jacket',
    review:
        'High-quality leather and excellent craftsmanship. Runs slightly large.',
    rating: 4,
    date: '2024-03-09',
    sellerReview: Review(
      id: 'seller_rev3',
      userName: 'Fashion Support',
      productId: 'premium-leather-jacket',
      review:
          'Thanks for the size feedback! We recommend checking our size guide for the perfect fit.',
      rating: 5,
      date: '2024-03-10',
    ),
  ),
  Review(
    id: 'rev7_1',
    userName: 'Phoebe Buffay',
    productId: 'premium-leather-jacket',
    review: 'The leather quality is outstanding. Gets better with age.',
    rating: 5,
    date: '2024-03-08',
  ),
  Review(
    id: 'rev7_2',
    userName: 'Robert Green',
    productId: 'premium-leather-jacket',
    review: 'Perfect for winter. Very warm and stylish.',
    rating: 5,
    date: '2024-03-07',
  ),

  // Reviews for Casual Blue T-Shirt
  Review(
    id: 'rev8',
    userName: 'Michael Scott',
    productId: 'casual-blue-tshirt',
    review: 'Great everyday t-shirt. Washes well and maintains shape.',
    rating: 5,
    date: '2024-03-08',
  ),
  Review(
    id: 'rev8_1',
    userName: 'Jim Halpert',
    productId: 'casual-blue-tshirt',
    review: 'Good quality cotton. Very comfortable for daily wear.',
    rating: 4,
    date: '2024-03-07',
  ),
  Review(
    id: 'rev8_2',
    userName: 'Dwight Schrute',
    productId: 'casual-blue-tshirt',
    review: 'The color hasn\'t faded even after multiple washes.',
    rating: 5,
    date: '2024-03-06',
  ),

  // Reviews for Comfort Slippers Collection
  Review(
    id: 'rev9',
    userName: 'Pam Beesly',
    productId: 'comfort-slippers-collection',
    review: 'Most comfortable slippers I\'ve ever owned!',
    rating: 5,
    date: '2024-03-07',
  ),
  Review(
    id: 'rev9_1',
    userName: 'Angela Martin',
    productId: 'comfort-slippers-collection',
    review: 'Perfect for home use. Very durable and easy to clean.',
    rating: 5,
    date: '2024-03-06',
  ),
  Review(
    id: 'rev9_2',
    userName: 'Oscar Martinez',
    productId: 'comfort-slippers-collection',
    review: 'Great grip and cushioning. Worth the price.',
    rating: 4,
    date: '2024-03-05',
  ),

  // Reviews for Nike Basketball Pro
  Review(
    id: 'rev10',
    userName: 'Kevin Malone',
    productId: 'nike-basketball-pro',
    review: 'Excellent grip on court. Perfect for professional play.',
    rating: 5,
    date: '2024-03-06',
  ),
  Review(
    id: 'rev10_1',
    userName: 'Stanley Hudson',
    productId: 'nike-basketball-pro',
    review: 'Great ankle support and cushioning. No break-in period needed.',
    rating: 5,
    date: '2024-03-05',
  ),
  Review(
    id: 'rev10_2',
    userName: 'Andy Bernard',
    productId: 'nike-basketball-pro',
    review: 'Best basketball shoes I\'ve used. Excellent for quick movements.',
    rating: 5,
    date: '2024-03-04',
  ),

  // Reviews for Luxury Bedroom Set
  Review(
    id: 'rev11',
    userName: 'Kelly Kapoor',
    productId: 'luxury-bedroom-set',
    review:
        'Beautiful design and sturdy construction. Assembly was straightforward.',
    rating: 4,
    date: '2024-03-05',
  ),
  Review(
    id: 'rev11_1',
    userName: 'Ryan Howard',
    productId: 'luxury-bedroom-set',
    review: 'The quality of materials is exceptional. Very elegant look.',
    rating: 5,
    date: '2024-03-04',
  ),
  Review(
    id: 'rev11_2',
    userName: 'Toby Flenderson',
    productId: 'luxury-bedroom-set',
    review: 'Transformed my bedroom completely. Great storage space.',
    rating: 5,
    date: '2024-03-03',
  ),

  // Reviews for iPhone 14 Series
  Review(
    id: 'rev12',
    userName: 'Creed Bratton',
    productId: 'iphone-14-series',
    review: 'The best iPhone yet! Camera quality is mind-blowing.',
    rating: 5,
    date: '2024-03-04',
  ),
  Review(
    id: 'rev12_1',
    userName: 'Meredith Palmer',
    productId: 'iphone-14-series',
    review: 'Dynamic Island is a game changer. Love the always-on display.',
    rating: 5,
    date: '2024-03-03',
  ),
  Review(
    id: 'rev12_2',
    userName: 'Phyllis Vance',
    productId: 'iphone-14-series',
    review:
        'Battery life is impressive. Lasts almost two days with moderate use.',
    rating: 5,
    date: '2024-03-02',
  ),

  // Reviews for Acer Laptop Premium Series
  Review(
    id: 'rev13',
    userName: 'Darryl Philbin',
    productId: 'acer-laptop-premium-series',
    review: 'Great value for money. Handles all my work tasks smoothly.',
    rating: 4,
    date: '2024-03-03',
  ),
  Review(
    id: 'rev13_1',
    userName: 'Erin Hannon',
    productId: 'acer-laptop-premium-series',
    review: 'Perfect for gaming and content creation. Runs cool under load.',
    rating: 5,
    date: '2024-03-02',
  ),
  Review(
    id: 'rev13_2',
    userName: 'Holly Flax',
    productId: 'acer-laptop-premium-series',
    review: 'The display is stunning. Great for photo editing.',
    rating: 5,
    date: '2024-03-01',
  ),

  // Reviews for Premium Dog Food
  Review(
    id: 'rev14',
    userName: 'Jan Levinson',
    productId: 'premium-dog-food',
    review: 'My dog loves it! Noticed improved energy levels.',
    rating: 5,
    date: '2024-03-02',
  ),
  Review(
    id: 'rev14_1',
    userName: 'David Wallace',
    productId: 'premium-dog-food',
    review: 'Great ingredients list. My picky eater actually enjoys this.',
    rating: 5,
    date: '2024-03-01',
  ),
  Review(
    id: 'rev14_2',
    userName: 'Karen Filippelli',
    productId: 'premium-dog-food',
    review: 'Coat looks healthier after switching to this brand.',
    rating: 5,
    date: '2024-02-29',
  ),

  // Reviews for Nike Wildhouse
  Review(
    id: 'rev15',
    userName: 'Roy Anderson',
    productId: 'nike-wildhouse',
    review: 'Perfect for trail running. Great grip on all surfaces.',
    rating: 5,
    date: '2024-03-01',
  ),
  Review(
    id: 'rev15_1',
    userName: 'Bob Vance',
    productId: 'nike-wildhouse',
    review: 'Excellent water resistance. Feet stay dry in wet conditions.',
    rating: 5,
    date: '2024-02-29',
  ),
  Review(
    id: 'rev15_2',
    userName: 'Todd Packer',
    productId: 'nike-wildhouse',
    review: 'Very durable. Still going strong after 6 months of heavy use.',
    rating: 4,
    date: '2024-02-28',
  ),
];
