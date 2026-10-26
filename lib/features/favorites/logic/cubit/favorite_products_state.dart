part of 'favorite_products_cubit.dart';

@immutable
sealed class FavoriteProductsState {}

final class FavoriteProductsInitial extends FavoriteProductsState {}

class FavoriteProductsLoading extends FavoriteProductsState {}

class FavoriteProductsSuccess extends FavoriteProductsState {
  final List<FavoriteProductLocalModel> favoriteProducts;

  FavoriteProductsSuccess(this.favoriteProducts);
}

class FavoriteProductsFailure extends FavoriteProductsState {
  final String errorMessage;

  FavoriteProductsFailure(this.errorMessage);
}

