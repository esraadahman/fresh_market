import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/style/app_colors.dart';

class HeaderDetails extends StatefulWidget {
  final ProductDetailsModel product;
  final bool isFavorite;

  const HeaderDetails({
    super.key,
    required this.isFavorite,
    required this.product,
  });

  @override
  State<HeaderDetails> createState() => _HeaderDetailsState();
}

class _HeaderDetailsState extends State<HeaderDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 280.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Red curved background
          ClipPath(
            clipper: _HeaderCurveClipper(),
            child: Container(
              height: 270.h,
              width: double.infinity,
              color: AppColors.primary,
            ),
          ),

          // Back & favorite buttons
          Positioned(
            top: 50.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleIconButton(
                  icon: Icons.arrow_back_rounded,
                  onTap: () => Navigator.of(context).pop(),
                ),
                _circleIconButton(
                  icon: widget.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  iconColor: widget.isFavorite ? Colors.red : Colors.black,
                  onTap: () async {
                    final newFavoriteState = await context
                        .read<GetProductDetailsCubit>()
                        .toggleFavorite();

                    if (!mounted || newFavoriteState == null) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          newFavoriteState
                              ? 'Product added to favorites'
                              : 'Product removed from favorites',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Floating circular product image
          Positioned(
            bottom: -50,
            child: Container(
              height: 180.w,
              width: 180.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  widget.product.thumbnail ?? '',
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) {
                    return const Center(
                      child: Icon(Icons.image_not_supported_outlined, size: 60),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        height: 44.w,
        width: 44.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: 22.sp),
      ),
    );
  }
}

/// Clips the red header into a curved shape, dipping down in the center-bottom.
class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
