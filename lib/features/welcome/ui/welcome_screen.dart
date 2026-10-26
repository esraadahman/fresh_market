import 'package:google_fonts/google_fonts.dart';
import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/helper/spacing.dart';
import 'package:fresh_market/core/style/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            children: [
              verticalSpace(24),
              Expanded(child: _WelcomeHeroSection()),
              verticalSpace(24),
              _buildBottomContent(context),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Column(
      children: [
        Text(
          'Find Your\nFavorite Products',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 34.w,
            height: 1.12,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        verticalSpace(14),
        Text(
          'Browse fresh items, discover offers,\nand shop faster with a clean experience.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 15.w,
            height: 1.6,
            fontWeight: FontWeight.w500,
            color: AppColors.textGrey,
          ),
        ),
        verticalSpace(28),
        SizedBox(
          height: 58.h,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.pushReplacementNamed(Routes.allProductsScreen);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              shadowColor: AppColors.primary.withOpacity(0.35),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: GoogleFonts.nunito(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
                horizontalSpace(10),
                Icon(Icons.arrow_forward_rounded, size: 22.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WelcomeHeroSection extends StatelessWidget {
  const _WelcomeHeroSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          child: Container(
            height: 270,
            width: 270,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 58,
          child: Container(
            height: 210,
            width: 210,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.16),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 78,
          child: Container(
            height: 170,
            width: 170,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.card,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: ClipOval(
              child: Container(
                color: const Color(0xffFFF1EC),
                child: const Icon(
                  Icons.fastfood_rounded,
                  size: 72,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          top: 42,
          child: _FloatingInfoCard(
            icon: Icons.local_offer_rounded,
            title: 'Offers',
            subtitle: 'Best deals',
          ),
        ),
        const Positioned(
          right: 0,
          top: 120,
          child: _FloatingInfoCard(
            icon: Icons.delivery_dining_rounded,
            title: 'Fast',
            subtitle: 'Delivery',
          ),
        ),
        Positioned(
          left: 30,
          bottom: 150,
          child: _SmallProductBubble(
            icon: Icons.apple_rounded,
            size: 74,
            color: AppColors.primary.withOpacity(0.14),
          ),
        ),
        Positioned(
          right: 34,
          bottom: 90,
          child: _SmallProductBubble(
            icon: Icons.restaurant_rounded,
            size: 88,
            color: const Color(0xffFFE8DF),
          ),
        ),
      ],
    );
  }
}

class _FloatingInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FloatingInfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.13),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: AppColors.primary, size: 21),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallProductBubble extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const _SmallProductBubble({
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(icon, color: AppColors.primary, size: size * 0.42),
    );
  }
}
