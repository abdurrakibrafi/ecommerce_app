class ProductModel {
  final int pid;
  final String imgUrl;
  final String title;
  final double price;
  final String shortDescription;
  final String longDescription;
  final int reviews;
  final double rating;
  bool isSelected;
  int qty;

  ProductModel({
    required this.pid,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.shortDescription,
    required this.longDescription,
    required this.reviews,
    required this.rating,
    this.isSelected = false,
    this.qty = 1,
  });

  ProductModel copyWith({
    int? pid,
    String? imgUrl,
    String? title,
    double? price,
    String? shortDescription,
    String? longDescription,
    int? reviews,
    double? rating,
    bool? isSelected,
    int? qty,
  }) {
    return ProductModel(
      pid: pid ?? this.pid,
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      price: price ?? this.price,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      reviews: reviews ?? this.reviews,
      rating: rating ?? this.rating,
      isSelected: isSelected ?? this.isSelected,
      qty: qty ?? this.qty,
    );
  }
}
