import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/style/app_colors.dart';

class BottomBar extends StatefulWidget {
  final ProductDetailsModel product;
  const BottomBar({super.key, required this.product});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Quantity stepper
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                _stepperButton(
                  icon: Icons.remove_rounded,
                  onTap: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                ),
                SizedBox(
                  width: 30.w,
                  child: Text(
                    '$quantity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                _stepperButton(
                  icon: Icons.add_rounded,
                  onTap: () => setState(() => quantity++),
                ),
              ],
            ),
          ),

          // Price
          Text(
            '\$${(widget.product.priceAfterDiscount ?? 0).toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _stepperButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Icon(icon, color: Colors.white, size: 18.sp),
      ),
    );
  }
}
