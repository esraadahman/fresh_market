import 'package:fresh_market/core/helper/common_imports.dart';

class ProductDetailsRepo {
  final ApiServices apiService;

  ProductDetailsRepo(this.apiService);

  Future<Either<Failure, ProductDetailsResponseModel>> getProductDetails({
    required String slug,
  }) async {
    try {
      final response = await apiService.getProductDetails(slug);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }

      return left(ServerFailure(localizedKey: "unexpected_error"));
    }
  }
}
