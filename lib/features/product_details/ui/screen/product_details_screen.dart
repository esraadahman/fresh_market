import 'package:google_fonts/google_fonts.dart';
import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/helper/spacing.dart';
import 'package:fresh_market/core/style/app_colors.dart';
import 'package:fresh_market/features/product_details/ui/widgets/bottom_bar.dart';
import 'package:fresh_market/features/product_details/ui/widgets/header_details.dart';
import 'package:fresh_market/features/product_details/ui/widgets/title_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.slug});

  final String slug;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductDetailsCubit>().getProductDetails(slug: widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, state) {
          if (state is GetProductDetailsFailure) {
            return CustomErrorWidget(title: state.errorMessage);
          }

          if (state is GetProductDetailsSuccess) {
            final product = state.product;

            return Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 100.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: HeaderDetails(
                          product: product,
                          isFavorite: state.isFavorite,
                        ),
                      ),

                      verticalSpace(32),

                      // Title / time / rating
                      TitleWidget(productName: product.name ?? ""),

                      verticalSpace(24),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((product.description ?? '').isNotEmpty) ...[
                              Text(
                                'Description',
                                style: GoogleFonts.nunito(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              verticalSpace(10),
                              Text(
                                removeHtmlTags(product.description ?? ''),
                                style: GoogleFonts.nunito(
                                  fontSize: 14.sp,
                                  height: 1.6,
                                  color: Colors.grey[600],
                                ),
                              ),
                              verticalSpace(24),
                            ],

                            if ((product.relatedIds ?? []).isNotEmpty) ...[
                              Text(
                                'Related Products',
                                style: GoogleFonts.nunito(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              verticalSpace(14),
                              SizedBox(
                                height: 150.h,

                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: product.relatedIds!.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(width: 14.w),
                                  itemBuilder: (context, index) {
                                    final related = product.relatedIds![index];

                                    return Column(
                                      children: [
                                        Container(
                                          height: 100.w,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.background,
                                            borderRadius: BorderRadius.circular(
                                              18.r,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              18.r,
                                            ),
                                            child: Image.network(
                                              related.thumbnail ?? '',
                                              fit: BoxFit.fill,
                                              errorBuilder: (_, __, ___) {
                                                return const Icon(
                                                  Icons
                                                      .image_not_supported_outlined,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        verticalSpace(4),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                            firstTwoWords(related.name ?? ''),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BottomBar(product: product),
                ),
              ],
            );
          }

          return const ProductDetailsShimmerLoadingWidget();
        },
      ),
    );
  }
}
