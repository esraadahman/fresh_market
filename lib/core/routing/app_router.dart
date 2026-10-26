import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/features/welcome/ui/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.allProductsScreen:
        return MaterialPageRoute(
          builder: (context) => const AllProductsScreen(),
        );
      case Routes.productDetailsScreen:
        final slug = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(slug: slug),
        );
      case Routes.favoriteProductsScreen:
        return MaterialPageRoute(
          builder: (context) => FavoriteProductsScreen(),
        );
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
    }
    return null;
  }
}
