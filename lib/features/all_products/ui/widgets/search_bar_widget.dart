import 'package:google_fonts/google_fonts.dart';
import 'package:fresh_market/core/helper/common_imports.dart';
class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String text) onChange;
  final ValueChanged<String>? onSubmitted;
  const SearchBarWidget({
    super.key,
    required this.onChange,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Search products',
          hintStyle: GoogleFonts.nunito(
            color: Color(0xff9CA3AF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xff9CA3AF),
          ),
          suffixIcon: controller.text.isEmpty
              ? const Icon(Icons.tune_rounded, color: Color(0xffEF4444))
              : IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Color(0xffEF4444),
                  ),
                  onPressed: () {
                    controller.clear();

                    // setState(() {
                    //   _searchText = '';
                    // });
                  },
                ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
