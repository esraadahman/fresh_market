// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseModel _$ProductsResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductsResponseModel(
  data: json['data'] == null
      ? null
      : ProductsDataModel.fromJson(json['data'] as Map<String, dynamic>),
  msg: json['msg'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsResponseModelToJson(
  ProductsResponseModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'msg': instance.msg,
  'status': instance.status,
};

ProductsDataModel _$ProductsDataModelFromJson(Map<String, dynamic> json) =>
    ProductsDataModel(
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
      productsPerPage: json['products_per_page'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDataModelToJson(ProductsDataModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'products_per_page': instance.productsPerPage,
      'products': instance.products,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      total: (json['total'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      nextPageUrl: json['next_page_url'] as String?,
      prevPageUrl: json['prev_page_url'] as String?,
      from: (json['from'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'next_page_url': instance.nextPageUrl,
      'prev_page_url': instance.prevPageUrl,
      'from': instance.from,
      'to': instance.to,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  categoryIds: (json['category_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  priceBeforeDiscount: json['price_before_discount'] as num?,
  priceAfterDiscount: json['price_after_discount'] as num?,
  thumbnail: json['thumbnail'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  inWishlist: json['in_wishlist'] as bool?,
  slug: json['slug'] as String?,
  productStockCount: (json['product_stock_count'] as num?)?.toInt(),
  discount: json['discount'] as num?,
  isTaxable: json['is_taxable'] as bool?,
  buyTogetherId: (json['buy_together_id'] as num?)?.toInt(),
  buyItTogether: json['buy_it_together'],
  mainProductDiscount: json['main_product_discount'] as num?,
  buyTogetherDiscount: json['buy_together_discount'] as num?,
  orderDetailsCount: (json['order_details_count'] as num?)?.toInt(),
  cartCount: (json['cart_count'] as num?)?.toInt(),
  variant: json['variant'],
  variants: (json['variants'] as List<dynamic>?)
      ?.map((e) => ProductVariantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_ids': instance.categoryIds,
      'price_before_discount': instance.priceBeforeDiscount,
      'price_after_discount': instance.priceAfterDiscount,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'in_wishlist': instance.inWishlist,
      'slug': instance.slug,
      'product_stock_count': instance.productStockCount,
      'discount': instance.discount,
      'is_taxable': instance.isTaxable,
      'buy_together_id': instance.buyTogetherId,
      'buy_it_together': instance.buyItTogether,
      'main_product_discount': instance.mainProductDiscount,
      'buy_together_discount': instance.buyTogetherDiscount,
      'order_details_count': instance.orderDetailsCount,
      'cart_count': instance.cartCount,
      'variant': instance.variant,
      'variants': instance.variants,
    };

ProductVariantModel _$ProductVariantModelFromJson(Map<String, dynamic> json) =>
    ProductVariantModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      categoryIds: (json['category_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      option: json['option'] as String?,
      priceBeforeDiscount: json['price_before_discount'] as num?,
      priceAfterDiscount: json['price_after_discount'] as num?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      inWishlist: json['in_wishlist'] as bool?,
      slug: json['slug'] as String?,
      productStockCount: (json['product_stock_count'] as num?)?.toInt(),
      discount: json['discount'] as num?,
      isTaxable: json['is_taxable'] as bool?,
    );

Map<String, dynamic> _$ProductVariantModelToJson(
  ProductVariantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category_ids': instance.categoryIds,
  'option': instance.option,
  'price_before_discount': instance.priceBeforeDiscount,
  'price_after_discount': instance.priceAfterDiscount,
  'images': instance.images,
  'in_wishlist': instance.inWishlist,
  'slug': instance.slug,
  'product_stock_count': instance.productStockCount,
  'discount': instance.discount,
  'is_taxable': instance.isTaxable,
};
