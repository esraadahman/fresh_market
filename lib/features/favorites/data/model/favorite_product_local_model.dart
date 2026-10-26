import 'package:json_annotation/json_annotation.dart';

part 'favorite_product_local_model.g.dart';

@JsonSerializable()
class FavoriteProductLocalModel {
  @JsonKey(name: 'slug')
  final String slug;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  @JsonKey(name: 'priceAfterDiscount')
  final num priceAfterDiscount;

  @JsonKey(name: 'priceBeforeDiscount')
  final num priceBeforeDiscount;

  @JsonKey(name: 'discount')
  final num discount;

  const FavoriteProductLocalModel({
    required this.slug,
    required this.name,
    required this.thumbnail,
    required this.priceAfterDiscount,
    required this.priceBeforeDiscount,
    required this.discount,
  });

  factory FavoriteProductLocalModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductLocalModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProductLocalModelToJson(this);
}