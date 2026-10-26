import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fresh_market/features/all_products/data/model/products_response_model.dart';
import 'package:fresh_market/features/all_products/data/repo/all_products_repo.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this.repo) : super(GetAllProductsInitial());
  final AllProductsRepo repo;
  int page = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  List<ProductModel> products = [];
  String selectedFilter = 'All';

  final List<String> filters = const [
    'All',
    'Discount',
    'High Price',
    'Low Price',
  ];

  List<ProductModel> get filteredProducts {
    List<ProductModel> result = List.from(products);

    if (selectedFilter == 'Discount') {
      result = result.where((product) {
        return (product.discount ?? 0) > 0;
      }).toList();
    }

    if (selectedFilter == 'High Price') {
      result.sort((a, b) {
        final aPrice = a.priceAfterDiscount ?? 0;
        final bPrice = b.priceAfterDiscount ?? 0;
        return bPrice.compareTo(aPrice);
      });
    }

    if (selectedFilter == 'Low Price') {
      result.sort((a, b) {
        final aPrice = a.priceAfterDiscount ?? 0;
        final bPrice = b.priceAfterDiscount ?? 0;
        return aPrice.compareTo(bPrice);
      });
    }

    return result;
  }

  void changeFilter(String filter) {
    selectedFilter = filter;
    emit(
      GetAllProductsSuccess(
        products: filteredProducts,
        selectedFilter: selectedFilter,
        filters: filters,
      ),
    );
  }

  Future<void> getFirstPage(String name) async {
    emit(GetAllProductsLoading());

    page = 1;
    products.clear();
    hasMoreData = true;
    final response = await repo.getAllProducts(page: page, name: name);
    response.fold(
      (failure) {
        emit(GetAllProductsFailure(errorMessage: failure.displayMessage));
      },
      (result) {
        products = result.data?.products ?? [];

        emit(
          GetAllProductsSuccess(
            products: products,
            selectedFilter: selectedFilter,
            filters: filters,
          ),
        );
      },
    );
  }

  Future<void> getNextPage() async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;
    page++;

    final response = await repo.getAllProducts(page: page);

    response.fold(
      (failure) {
        emit(GetAllProductsFailure(errorMessage: failure.displayMessage));
      },
      (result) {
        final newProducts = result.data?.products ?? [];

        if (newProducts.isEmpty) {
          hasMoreData = false;
        } else {
          products.addAll(newProducts);
        }

        emit(
          GetAllProductsSuccess(
            products: products,
            selectedFilter: selectedFilter,
            filters: filters,
          ),
        );
      },
    );

    isLoading = false;
  }
}
