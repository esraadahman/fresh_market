import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/helper/spacing.dart';
import 'package:fresh_market/core/style/app_colors.dart';
import 'package:fresh_market/features/all_products/ui/widgets/empty_product_widget.dart';
import 'package:fresh_market/features/all_products/ui/widgets/filter_tap_widget.dart';
import 'package:fresh_market/features/all_products/ui/widgets/header_widget.dart';
import 'package:fresh_market/features/all_products/ui/widgets/search_bar_widget.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  ScrollController scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    context.read<GetAllProductsCubit>().getFirstPage('');
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<GetAllProductsCubit>().getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<GetAllProductsCubit>().getFirstPage('');
        context.read<GetAllProductsCubit>().selectedFilter = 'All';
        return Future.value();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
            builder: (context, state) {
              if (state is GetAllProductsSuccess) {
                return CustomScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderWidget(),
                            verticalSpace(24),
                            SearchBarWidget(
                              controller: _searchController,
                              onChange: (text) {
                                if (_debounce?.isActive ?? false) {
                                  _debounce!.cancel();
                                }

                                _debounce = Timer(
                                  const Duration(milliseconds: 500),
                                  () {
                                    context
                                        .read<GetAllProductsCubit>()
                                        .getFirstPage(text.trim());
                                  },
                                );
                              },
                              onSubmitted: (value) {
                                _debounce?.cancel();

                                context
                                    .read<GetAllProductsCubit>()
                                    .getFirstPage(value.trim());
                              },
                            ),
                            verticalSpace(24),
                            FilterTapWidget(),
                            verticalSpace(24),
                            Text(
                              'Recommended Products',
                              style: GoogleFonts.nunito(
                                fontSize: 18.w,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                            verticalSpace(16),
                          ],
                        ),
                      ),
                    ),

                    if (state.products.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: EmptyProductsWidget(),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final product = state.products[index];

                            return ProductCard(
                              product: product,
                              onTap: () {
                                final slug = product.slug;
                                if (slug == null || slug.isEmpty) return;
                                context.pushNamed(
                                  Routes.productDetailsScreen,
                                  arguments: slug,
                                );
                              },
                              onAddTap: () {},
                            );
                          }, childCount: state.products.length),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 18,
                                childAspectRatio: 0.70,
                              ),
                        ),
                      ),
                  ],
                );
              } else if (state is GetAllProductsFailure) {
                return CustomErrorWidget(title: state.errorMessage);
              }
              return const ShimmerLoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
