import 'package:fresh_market/core/helper/common_imports.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  //Api Service

  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  getIt.registerLazySingleton<AllProductsRepo>(() => AllProductsRepo(getIt()));
  getIt.registerFactory<GetAllProductsCubit>(
    () => GetAllProductsCubit(getIt()),
  );
  getIt.registerLazySingleton<ProductDetailsRepo>(
    () => ProductDetailsRepo(getIt()),
  );
  getIt.registerFactory<GetProductDetailsCubit>(
    () => GetProductDetailsCubit(getIt()),
  );

  getIt.registerFactory<FavoriteProductsCubit>(() => FavoriteProductsCubit());
}
