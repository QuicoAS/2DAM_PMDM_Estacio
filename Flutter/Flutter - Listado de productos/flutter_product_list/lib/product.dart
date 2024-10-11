class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.reviews,
  });
}

class Review {
  final int rating;
  final String comment;
  final String reviewerName;

  Review({
    required this.rating,
    required this.comment,
    required this.reviewerName,
  });
}
