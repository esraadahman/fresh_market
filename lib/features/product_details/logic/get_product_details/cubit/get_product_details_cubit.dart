import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fresh_market/features/favorites/data/model/favorite_product_local_model.dart';
import 'package:fresh_market/features/favorites/data/repo/favorite_repo.dart';
import 'package:fresh_market/features/product_details/data/model/product_details_response_model.dart';
import 'package:fresh_market/features/product_details/data/repo/product_details_repo.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit(this.repo) : super(GetProductDetailsInitial());
  final ProductDetailsRepo repo;

  getProductDetails({required String slug}) async {
    emit(GetProductDetailsLoading());
    final response = await repo.getProductDetails(slug: slug);

    response.fold(
      (failure) {
        emit(GetProductDetailsFailure(errorMessage: failure.displayMessage));
      },
      (result) async {
        final isFavorite = await FavoriteLocalStorage.isFavorite(slug);

        emit(
          GetProductDetailsSuccess(
            product: result.data?.productDetails ?? ProductDetailsModel(),
            isFavorite: isFavorite,
          ),
        );
      },
    );
  }

  Future<bool?> toggleFavorite() async {
    final currentState = state;
    if (currentState is! GetProductDetailsSuccess) return null;

    final favoriteProduct = _mapProductToFavorite(currentState.product);
    if (favoriteProduct == null) return null;

    final isFavorite = await FavoriteLocalStorage.toggleFavoriteProduct(
      favoriteProduct,
    );

    emit(
      GetProductDetailsSuccess(
        product: currentState.product,
        isFavorite: isFavorite,
      ),
    );

    return isFavorite;
  }

  FavoriteProductLocalModel? _mapProductToFavorite(
    ProductDetailsModel product,
  ) {
    final slug = product.slug;
    if (slug == null || slug.isEmpty) return null;

    return FavoriteProductLocalModel(
      slug: slug,
      name: product.name ?? '',
      thumbnail: product.thumbnail ?? '',
      priceAfterDiscount: product.priceAfterDiscount ?? 0,
      priceBeforeDiscount: product.priceBeforeDiscount ?? 0,
      discount: product.discount ?? 0,
    );
  }
}
