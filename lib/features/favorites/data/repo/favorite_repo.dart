import 'package:fresh_market/core/helper/common_imports.dart';
class FavoriteLocalStorage {
  static const String _favoritesKey = 'favorite_products';

  static Future<List<FavoriteProductLocalModel>> getFavoriteProducts() async {
    final String data = await SharedPrefHelper.getString(_favoritesKey);

    if (data.isEmpty) return [];

    try {
      final decodedData = jsonDecode(data);

      if (decodedData is List) {
        return decodedData
            .map((item) => FavoriteProductLocalModel.fromJson(item))
            .toList();
      }

      return [];
    } catch (_) {
      return [];
    }
  }

  static Future<bool> isFavorite(String slug) async {
    final favorites = await getFavoriteProducts();

    return favorites.any((product) => product.slug == slug);
  }

  static Future<void> addFavoriteProduct(
    FavoriteProductLocalModel product,
  ) async {
    final favorites = await getFavoriteProducts();

    final alreadyExists = favorites.any(
      (favoriteProduct) => favoriteProduct.slug == product.slug,
    );

    if (!alreadyExists) {
      favorites.add(product);
      await _saveFavorites(favorites);
    }
  }

  static Future<void> removeFavoriteProduct(String slug) async {
    final favorites = await getFavoriteProducts();

    favorites.removeWhere((product) => product.slug == slug);

    await _saveFavorites(favorites);
  }

  static Future<bool> toggleFavoriteProduct(
    FavoriteProductLocalModel product,
  ) async {
    final isProductFavorite = await isFavorite(product.slug);

    if (isProductFavorite) {
      await removeFavoriteProduct(product.slug);
      return false;
    } else {
      await addFavoriteProduct(product);
      return true;
    }
  }

  static Future<void> _saveFavorites(
    List<FavoriteProductLocalModel> favorites,
  ) async {
    final encodedData = jsonEncode(
      favorites.map((product) => product.toJson()).toList(),
    );

    await SharedPrefHelper.saveDataByKey(_favoritesKey, encodedData);
  }
}
