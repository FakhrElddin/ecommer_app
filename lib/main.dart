import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/cache/shared_prefs_utils.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_constants.dart';
import 'package:ecommerce_app/features/ui/pages/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/cart_screen/cart_screen.dart';
import 'features/ui/pages/home_screen/home_screen.dart';
import 'features/ui/pages/product_details_screen/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  var token = SharedPrefsUtils.getData(key: AppConstants.userToken);
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductsTabCubit>()..getAllProducts()),
        BlocProvider(create: (context) => getIt<CartCubit>()..getCartItems()),
      ],
      child: MyApp(isTokenSaved: token != null ? true : false),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isTokenSaved});

  final bool? isTokenSaved;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute(),
          routes: {
            AppRoutes.loginRoute: (context) => const LoginScreen(),
            AppRoutes.registerRoute: (context) => const RegisterScreen(),
            AppRoutes.homeRoute: (context) => const HomeScreen(),
            AppRoutes.cartRoute: (context) =>  CartScreen(),
            AppRoutes.productRoute: (context) => const ProductDetailsScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }

  String initialRoute() {
    return isTokenSaved == null || isTokenSaved == false
        ? AppRoutes.loginRoute
        : AppRoutes.homeRoute;
  }
}
