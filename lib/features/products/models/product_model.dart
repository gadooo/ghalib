import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwt_starter_template/features/products/models/product_attribute_model.dart';
import 'package:cwt_starter_template/features/products/models/product_variation_model.dart';
import '../../dashboard/ecommerce/models/brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double? salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  /// Empty object
  static ProductModel empty() => ProductModel(
    id: '',
    title: '',
    stock: 0,
    price: 0,
    thumbnail: '',
    productType: '',
  );

  /// ✅ Map Firestore JSON → Model
  factory ProductModel.fromMap(Map<String, dynamic> data, String documentId) {
    return ProductModel(
      id: documentId,
      title: data['title'] ?? '',
      stock: data['stock'] ?? 0,
      price: (data['price'] ?? 0).toDouble(),
      thumbnail: data['thumbnail'] ?? '',
      productType: data['productType'] ?? '',
      sku: data['sku'],
      salePrice:
          data['salePrice'] != null ? (data['salePrice']).toDouble() : null,
      isFeatured: data['isFeatured'],
      description: data['description'],
      categoryId: data['categoryId'],
      date: data['date'] != null ? (data['date'] as Timestamp).toDate() : null,
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      brand: data['brand'] != null ? BrandModel.fromMap(data['brand']) : null,
      productAttributes:
          data['productAttributes'] != null
              ? (data['productAttributes'] as List)
                  .map((attr) => ProductAttributeModel.fromMap(attr))
                  .toList()
              : [],
      productVariations:
          data['productVariations'] != null
              ? (data['productVariations'] as List)
                  .map((v) => ProductVariationModel.fromMap(v))
                  .toList()
              : [],
    );
  }

  /// ✅ Map Model → Firestore JSON
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stock': stock,
      'price': price,
      'thumbnail': thumbnail,
      'productType': productType,
      'sku': sku,
      'salePrice': salePrice,
      'isFeatured': isFeatured,
      'description': description,
      'categoryId': categoryId,
      'date': date,
      'images': images,
      'brand': brand?.toMap(),
      'productAttributes': productAttributes?.map((a) => a.toMap()).toList(),
      'productVariations': productVariations?.map((v) => v.toMap()).toList(),
    };
  }
}
