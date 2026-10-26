import 'package:fresh_market/core/helper/common_imports.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded, size: 52, color: Color(0xff9CA3AF)),
            SizedBox(height: 12),
            Text(
              'No products found',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff111827),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Try another search or filter.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(fontSize: 13, color: Color(0xff6B7280)),
            ),
          ],
        ),
      ),
    );
  }
}
