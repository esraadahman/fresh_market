import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/helper/spacing.dart';
import 'package:fresh_market/core/style/app_colors.dart';
import 'package:fresh_market/features/product_details/ui/widgets/title_widget.dart';

class FavoriteProductsScreen extends StatefulWidget {
  const FavoriteProductsScreen({super.key});

  @override
  State<FavoriteProductsScreen> createState() => _FavoriteProductsScreenState();
}

class _FavoriteProductsScreenState extends State<FavoriteProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteProductsCubit>().loadFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Favorite',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xff111827),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
      ),
      body: BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
        builder: (context, state) {
          if (state is FavoriteProductsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          if (state is FavoriteProductsSuccess) {
            if (state.favoriteProducts.isEmpty) {
              return Center(
                child: Text(
                  'No favorite products yet',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: state.favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = state.favoriteProducts[index];

                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.productDetailsScreen,
                      arguments: product.slug,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Left: Product Image with Rounded Corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            product.thumbnail,
                            width: 85,
                            height: 85,
                            fit: BoxFit.fill,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                width: 85.w,
                                height: 85.h,
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 30.sp,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                        horizontalSpace(12),

                        // Center: Texts (Title, Tag/Subtitle, Price)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D2D2D),
                                  ),
                                ),
                              ),
                              verticalSpace(4),
                              Text(
                                firstTwoWords(product.slug),
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              verticalSpace(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${product.priceAfterDiscount.toStringAsFixed(2)}',
                                    style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    '\$${product.priceBeforeDiscount.toStringAsFixed(2)}',
                                    style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textGrey.withOpacity(.4),
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: AppColors.textGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const ShimmerLoadingWidget();
        },
      ),
    );
  }
}
