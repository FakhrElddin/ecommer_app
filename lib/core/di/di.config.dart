// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources_impl/remote_data_sources/auth_remote_data_source_impl.dart'
    as _i159;
import '../../data/data_sources_impl/remote_data_sources/cart_remote_data_source_impl.dart'
    as _i661;
import '../../data/data_sources_impl/remote_data_sources/home_remote_data_source_impl.dart'
    as _i571;
import '../../data/repositories_impl/auth_repository_impl.dart' as _i98;
import '../../data/repositories_impl/cart_repository_impl.dart' as _i534;
import '../../data/repositories_impl/home_repository_impl.dart' as _i320;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/cart/cart_repository.dart' as _i388;
import '../../domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart'
    as _i327;
import '../../domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart'
    as _i629;
import '../../domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart'
    as _i923;
import '../../domain/repositories/home/home_repository.dart' as _i22;
import '../../domain/use_cases/add_to_cart_use_case.dart' as _i1024;
import '../../domain/use_cases/delete_item_from_cart_use_case.dart' as _i906;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/get_all_products_use_casse.dart' as _i725;
import '../../domain/use_cases/get_cart_items_use_case.dart' as _i136;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../domain/use_cases/update_cart_item_quantity_use_case.dart'
    as _i358;
import '../../features/ui/auth/login/cubit/login_cubit.dart' as _i209;
import '../../features/ui/auth/register/cubit/register_cubit.dart' as _i547;
import '../../features/ui/pages/cart_screen/cubit/cart_cubit.dart' as _i164;
import '../../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart'
    as _i843;
import '../../features/ui/pages/home_screen/tabs/products_tab/cubit/products_tab_cubit.dart'
    as _i740;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i629.CartRemoteDataSource>(
      () => _i661.CartRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i327.AuthRemoteDataSource>(
      () => _i159.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i923.HomeRemoteDataSource>(
      () => _i571.HomeRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i388.CartRepository>(
      () => _i534.CartRepositoryImpl(
        remoteDataSource: gh<_i629.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i660.AuthRepository>(
      () => _i98.AuthRepositoryImpl(
        remoteDataSource: gh<_i327.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i22.HomeRepository>(
      () => _i320.HomeRepositoryImpl(
        remoteDataSource: gh<_i923.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i1024.AddToCartUseCase>(
      () => _i1024.AddToCartUseCase(homeRepository: gh<_i22.HomeRepository>()),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () =>
          _i773.GetAllBrandsUseCase(homeRepository: gh<_i22.HomeRepository>()),
    );
    gh.factory<_i201.GetAllCategoriesUseCase>(
      () => _i201.GetAllCategoriesUseCase(
        homeRepository: gh<_i22.HomeRepository>(),
      ),
    );
    gh.factory<_i725.GetAllProductsUseCasse>(
      () => _i725.GetAllProductsUseCasse(
        homeRepository: gh<_i22.HomeRepository>(),
      ),
    );
    gh.factory<_i843.HomeTabCubit>(
      () => _i843.HomeTabCubit(
        getAllCategoriesUseCase: gh<_i201.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i773.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i906.DeleteItemFromCartUseCase>(
      () => _i906.DeleteItemFromCartUseCase(
        cartRepository: gh<_i388.CartRepository>(),
      ),
    );
    gh.factory<_i136.GetCartItemsUseCase>(
      () =>
          _i136.GetCartItemsUseCase(cartRepository: gh<_i388.CartRepository>()),
    );
    gh.factory<_i358.UpdateCartItemQuantityUseCase>(
      () => _i358.UpdateCartItemQuantityUseCase(
        cartRepository: gh<_i388.CartRepository>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i164.CartCubit>(
      () => _i164.CartCubit(
        getCartItemsUseCase: gh<_i136.GetCartItemsUseCase>(),
        deleteItemFromCartUseCase: gh<_i906.DeleteItemFromCartUseCase>(),
        updateCartItemQuantityUseCase:
            gh<_i358.UpdateCartItemQuantityUseCase>(),
      ),
    );
    gh.factory<_i740.ProductsTabCubit>(
      () => _i740.ProductsTabCubit(
        getAllProductsUseCasse: gh<_i725.GetAllProductsUseCasse>(),
        addToCartUseCase: gh<_i1024.AddToCartUseCase>(),
      ),
    );
    gh.factory<_i209.LoginCubit>(
      () => _i209.LoginCubit(loginUseCase: gh<_i471.LoginUseCase>()),
    );
    gh.factory<_i547.RegisterCubit>(
      () => _i547.RegisterCubit(registerUseCase: gh<_i479.RegisterUseCase>()),
    );
    return this;
  }
}
