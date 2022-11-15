import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(anyMap: true)
class ProductModel {
  final int id;
  final String title;

  @JsonKey(name: 'product_type')
  final String productType;

  final String status;
  final List<String> tags;
  final String image;
  final List options;
  final int quantity;
  final String price;

  ProductModel({
    required this.id,
    required this.title,
    required this.productType,
    required this.status,
    required this.tags,
    required this.image,
    required this.options,
    required this.quantity,
    required this.price,
  });
  factory ProductModel.fromJson(Map json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
