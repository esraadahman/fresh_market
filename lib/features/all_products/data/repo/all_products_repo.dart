import 'package:fresh_market/core/helper/common_imports.dart';

class AllProductsRepo {
  final ApiServices apiService;

  AllProductsRepo(this.apiService);
  Future<Either<Failure, ProductsResponseModel>> getAllProducts({
    required int page,
    String name = '',
  }) async {
    try {
      final response = await apiService.getProducts(page, name);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }

      return left(ServerFailure(localizedKey: "unexpected_error"));
    }
  }
}
