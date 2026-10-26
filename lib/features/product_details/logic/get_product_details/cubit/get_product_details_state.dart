part of 'get_product_details_cubit.dart';

@immutable
sealed class GetProductDetailsState {}

final class GetProductDetailsInitial extends GetProductDetailsState {}


final class GetProductDetailsLoading extends GetProductDetailsState {}

final class GetProductDetailsSuccess extends GetProductDetailsState {
  final ProductDetailsModel product;
  final bool isFavorite;

  GetProductDetailsSuccess({
    required this.product,
    this.isFavorite = false,
  });
}

final class GetProductDetailsFailure extends GetProductDetailsState {
  final String errorMessage;

  GetProductDetailsFailure({required this.errorMessage});
}