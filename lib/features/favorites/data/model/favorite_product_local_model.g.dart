// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProductLocalModel _$FavoriteProductLocalModelFromJson(
  Map<String, dynamic> json,
) => FavoriteProductLocalModel(
  slug: json['slug'] as String,
  name: json['name'] as String,
  thumbnail: json['thumbnail'] as String,
  priceAfterDiscount: json['priceAfterDiscount'] as num,
  priceBeforeDiscount: json['priceBeforeDiscount'] as num,
  discount: json['discount'] as num,
);

Map<String, dynamic> _$FavoriteProductLocalModelToJson(
  FavoriteProductLocalModel instance,
) => <String, dynamic>{
  'slug': instance.slug,
  'name': instance.name,
  'thumbnail': instance.thumbnail,
  'priceAfterDiscount': instance.priceAfterDiscount,
  'priceBeforeDiscount': instance.priceBeforeDiscount,
  'discount': instance.discount,
};
