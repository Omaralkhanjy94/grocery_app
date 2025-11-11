import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/state_imports.dart';

/// The main entry point of the application.
class Grocery extends StatelessWidget {
  const Grocery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCurrentIndexCubit>(
          create: (context) => SplashCurrentIndexCubit(),
        ),
        BlocProvider<OfferIndexCubit>(create: (context) => OfferIndexCubit()),
        BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
      ],
      child: MaterialApp(
        navigatorKey: Go.navigatorKey,
        title: 'Grocery App',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/splash',
        routes: GoRoutes(),
      ),
    );
  }
}
