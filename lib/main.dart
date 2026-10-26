import 'package:fresh_market/core/helper/common_imports.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  // Stripe.publishableKey = 'pk_test_51UUHRdJfyfxOWZs0JV2Hik8Y03LEQl9iNk81xBqfj2IvH7hsFjK2iiqUKdZbfG8PnpKzndILK4W4s6ViBJvIv2vB001ab9JdBI';
  // await Stripe.instance.applySettings();
  runApp(MyApp(appRouter: AppRouter()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetAllProductsCubit>()),
        BlocProvider(create: (context) => getIt<GetProductDetailsCubit>()),
        BlocProvider(create: (context) => getIt<FavoriteProductsCubit>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        designSize: const Size(392, 872),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          initialRoute: Routes.welcomeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
