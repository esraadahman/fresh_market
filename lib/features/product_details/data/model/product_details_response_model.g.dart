// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponseModel _$ProductDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailsResponseModel(
  data: json['data'] == null
      ? null
      : ProductDetailsDataModel.fromJson(json['data'] as Map<String, dynamic>),
  msg: json['msg'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductDetailsResponseModelToJson(
  ProductDetailsResponseModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'msg': instance.msg,
  'status': instance.status,
};

ProductDetailsDataModel _$ProductDetailsDataModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailsDataModel(
  productDetails: json['productDetails'] == null
      ? null
      : ProductDetailsModel.fromJson(
          json['productDetails'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProductDetailsDataModelToJson(
  ProductDetailsDataModel instance,
) => <String, dynamic>{'productDetails': instance.productDetails?.toJson()};

ProductDetailsModel _$ProductDetailsModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  categoryIds: (json['category_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  priceBeforeDiscount: json['price_before_discount'] as num?,
  priceAfterDiscount: json['price_after_discount'] as num?,
  thumbnail: json['thumbnail'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  description: json['description'] as String?,
  shortDescription: json['short_description'] as String?,
  inWishlist: json['in_wishlist'] as bool?,
  slug: json['slug'] as String?,
  productStockCount: (json['product_stock_count'] as num?)?.toInt(),
  discount: json['discount'] as num?,
  rate: json['rate'] as num?,
  isTaxable: json['is_taxable'] as bool?,
  attributes: json['attributes'] as List<dynamic>?,
  relatedIds: (json['related_ids'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  translation: json['translation'] == null
      ? null
      : TranslationModel.fromJson(json['translation'] as Map<String, dynamic>),
  buyItTogether: json['buy_it_together'] as List<dynamic>?,
);

Map<String, dynamic> _$ProductDetailsModelToJson(
  ProductDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category_ids': instance.categoryIds,
  'price_before_discount': instance.priceBeforeDiscount,
  'price_after_discount': instance.priceAfterDiscount,
  'thumbnail': instance.thumbnail,
  'images': instance.images,
  'description': instance.description,
  'short_description': instance.shortDescription,
  'in_wishlist': instance.inWishlist,
  'slug': instance.slug,
  'product_stock_count': instance.productStockCount,
  'discount': instance.discount,
  'rate': instance.rate,
  'is_taxable': instance.isTaxable,
  'attributes': instance.attributes,
  'related_ids': instance.relatedIds?.map((e) => e.toJson()).toList(),
  'translation': instance.translation?.toJson(),
  'buy_it_together': instance.buyItTogether,
};

TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) =>
    TranslationModel(
      ar: TranslationModel._toInt(json['ar']),
      en: TranslationModel._toInt(json['en']),
    );

Map<String, dynamic> _$TranslationModelToJson(TranslationModel instance) =>
    <String, dynamic>{'ar': instance.ar, 'en': instance.en};
