// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map json) => ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      productType: json['product_type'] as String,
      status: json['status'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
      options: json['options'] as List<dynamic>,
      quantity: json['quantity'] as int,
      price: json['price'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'product_type': instance.productType,
      'status': instance.status,
      'tags': instance.tags,
      'image': instance.image,
      'options': instance.options,
      'quantity': instance.quantity,
      'price': instance.price,
    };
