class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double? salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// ✅ Map Firestore JSON → Model
  factory ProductVariationModel.fromMap(Map<String, dynamic> data) {
    return ProductVariationModel(
      id: data['id'] ?? '',
      sku: data['sku'] ?? '',
      image: data['image'] ?? '',
      description: data['description'],
      price: (data['price'] ?? 0).toDouble(),
      salePrice:
          data['salePrice'] != null ? (data['salePrice']).toDouble() : null,
      stock: data['stock'] ?? 0,
      attributeValues:
          data['attributeValues'] != null
              ? Map<String, String>.from(data['attributeValues'])
              : {},
    );
  }

  /// ✅ Map Model → Firestore JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }
}
