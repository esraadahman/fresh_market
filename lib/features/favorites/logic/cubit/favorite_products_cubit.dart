import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fresh_market/features/favorites/data/model/favorite_product_local_model.dart';
import 'package:fresh_market/features/favorites/data/repo/favorite_repo.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsInitial());
  Future<void> loadFavoriteProducts() async {
    try {
      emit(FavoriteProductsLoading());

      final products = await FavoriteLocalStorage.getFavoriteProducts();

      emit(FavoriteProductsSuccess(products));
    } catch (error) {
      emit(FavoriteProductsFailure(error.toString()));
    }
  }

  Future<void> removeProduct(String slug) async {
    try {
      await FavoriteLocalStorage.removeFavoriteProduct(slug);

      final products = await FavoriteLocalStorage.getFavoriteProducts();

      emit(FavoriteProductsSuccess(products));
    } catch (error) {
      emit(FavoriteProductsFailure(error.toString()));
    }
  }
}
