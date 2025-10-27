class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  /// Map Firestore JSON → Model
  factory ProductAttributeModel.fromMap(Map<String, dynamic> data) {
    return ProductAttributeModel(
      name: data['name'] as String?,
      values: data['values'] != null ? List<String>.from(data['values']) : [],
    );
  }

  /// Map Model → Firestore JSON
  Map<String, dynamic> toMap() {
    return {'name': name, 'values': values};
  }
}
