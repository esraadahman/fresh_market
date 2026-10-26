import 'package:json_annotation/json_annotation.dart';
import 'package:fresh_market/features/all_products/data/model/products_response_model.dart';

part 'product_details_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailsResponseModel {
  final ProductDetailsDataModel? data;
  final String? msg;
  final int? status;

  ProductDetailsResponseModel({this.data, this.msg, this.status});

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductDetailsDataModel {
  @JsonKey(name: 'productDetails')
  final ProductDetailsModel? productDetails;

  ProductDetailsDataModel({this.productDetails});

  factory ProductDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductDetailsModel {
  final int? id;
  final String? name;

  @JsonKey(name: 'category_ids')
  final List<int>? categoryIds;

  @JsonKey(name: 'price_before_discount')
  final num? priceBeforeDiscount;

  @JsonKey(name: 'price_after_discount')
  final num? priceAfterDiscount;

  final String? thumbnail;
  final List<String>? images;
  final String? description;

  @JsonKey(name: 'short_description')
  final String? shortDescription;

  @JsonKey(name: 'in_wishlist')
  final bool? inWishlist;

  final String? slug;

  @JsonKey(name: 'product_stock_count')
  final int? productStockCount;

  final num? discount;
  final num? rate;

  @JsonKey(name: 'is_taxable')
  final bool? isTaxable;

  final List<dynamic>? attributes;

  @JsonKey(name: 'related_ids')
  final List<ProductModel>? relatedIds;

  final TranslationModel? translation;

  @JsonKey(name: 'buy_it_together')
  final List<dynamic>? buyItTogether;

  ProductDetailsModel({
    this.id,
    this.name,
    this.categoryIds,
    this.priceBeforeDiscount,
    this.priceAfterDiscount,
    this.thumbnail,
    this.images,
    this.description,
    this.shortDescription,
    this.inWishlist,
    this.slug,
    this.productStockCount,
    this.discount,
    this.rate,
    this.isTaxable,
    this.attributes,
    this.relatedIds,
    this.translation,
    this.buyItTogether,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}

@JsonSerializable()
class TranslationModel {
  @JsonKey(fromJson: _toInt)
  final int? ar;

  @JsonKey(fromJson: _toInt)
  final int? en;

  TranslationModel({this.ar, this.en});

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationModelToJson(this);

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
