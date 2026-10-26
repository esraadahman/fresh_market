import 'package:json_annotation/json_annotation.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  final ProductsDataModel? data;
  final String? msg;
  final int? status;

  ProductsResponseModel({
    this.data,
    this.msg,
    this.status,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}

@JsonSerializable()
class ProductsDataModel {
  final PaginationModel? pagination;

  @JsonKey(name: 'products_per_page')
  final String? productsPerPage;

  final List<ProductModel>? products;

  ProductsDataModel({
    this.pagination,
    this.productsPerPage,
    this.products,
  });

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDataModelToJson(this);
}

@JsonSerializable()
class PaginationModel {
  final int? total;

  @JsonKey(name: 'per_page')
  final int? perPage;

  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  final int? from;
  final int? to;

  PaginationModel({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
    this.from,
    this.to,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

@JsonSerializable()
class ProductModel {
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

  @JsonKey(name: 'in_wishlist')
  final bool? inWishlist;

  final String? slug;

  @JsonKey(name: 'product_stock_count')
  final int? productStockCount;

  final num? discount;

  @JsonKey(name: 'is_taxable')
  final bool? isTaxable;

  @JsonKey(name: 'buy_together_id')
  final int? buyTogetherId;

  @JsonKey(name: 'buy_it_together')
  final dynamic buyItTogether;

  @JsonKey(name: 'main_product_discount')
  final num? mainProductDiscount;

  @JsonKey(name: 'buy_together_discount')
  final num? buyTogetherDiscount;

  @JsonKey(name: 'order_details_count')
  final int? orderDetailsCount;

  @JsonKey(name: 'cart_count')
  final int? cartCount;

  final dynamic variant;
  final List<ProductVariantModel>? variants;

  ProductModel({
    this.id,
    this.name,
    this.categoryIds,
    this.priceBeforeDiscount,
    this.priceAfterDiscount,
    this.thumbnail,
    this.images,
    this.inWishlist,
    this.slug,
    this.productStockCount,
    this.discount,
    this.isTaxable,
    this.buyTogetherId,
    this.buyItTogether,
    this.mainProductDiscount,
    this.buyTogetherDiscount,
    this.orderDetailsCount,
    this.cartCount,
    this.variant,
    this.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductVariantModel {
  final int? id;
  final String? name;

  @JsonKey(name: 'category_ids')
  final List<int>? categoryIds;

  final String? option;

  @JsonKey(name: 'price_before_discount')
  final num? priceBeforeDiscount;

  @JsonKey(name: 'price_after_discount')
  final num? priceAfterDiscount;

  final List<String>? images;

  @JsonKey(name: 'in_wishlist')
  final bool? inWishlist;

  final String? slug;

  @JsonKey(name: 'product_stock_count')
  final int? productStockCount;

  final num? discount;

  @JsonKey(name: 'is_taxable')
  final bool? isTaxable;

  ProductVariantModel({
    this.id,
    this.name,
    this.categoryIds,
    this.option,
    this.priceBeforeDiscount,
    this.priceAfterDiscount,
    this.images,
    this.inWishlist,
    this.slug,
    this.productStockCount,
    this.discount,
    this.isTaxable,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantModelToJson(this);
}