import 'package:google_fonts/google_fonts.dart';
import 'package:fresh_market/core/helper/common_imports.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            firstTwoWords(productName),
            style: GoogleFonts.nunito(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_outlined,
                size: 18.sp,
                color: const Color(0xFFE8453C),
              ),
              SizedBox(width: 6.w),
              Text(
                '30 min',
                style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 16.w),
              Icon(
                Icons.star_border_outlined,
                size: 18.sp,
                color: Colors.amber,
              ),
              SizedBox(width: 4.w),
              Text(
                '4.8',
                style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String firstTwoWords(String text) {
  final words = text.trim().split(' ');
  return words.take(2).join(' ');
}
