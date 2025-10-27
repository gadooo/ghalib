import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  final String name;
  final String? image;
  final String? description;
  final DateTime? createdAt;

  BrandModel({
    required this.id,
    required this.name,
    this.image,
    this.description,
    this.createdAt,
  });

  /// Empty object
  static BrandModel empty() => BrandModel(id: '', name: '');

  /// ✅ Map Firestore JSON → Model
  factory BrandModel.fromMap(Map<String, dynamic> data, {String? documentId}) {
    return BrandModel(
      id: documentId ?? data['id'] ?? '',
      name: data['name'] ?? '',
      image: data['image'],
      description: data['description'],
      createdAt:
          data['createdAt'] != null
              ? (data['createdAt'] as Timestamp).toDate()
              : null,
    );
  }

  /// ✅ Map Model → Firestore JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
