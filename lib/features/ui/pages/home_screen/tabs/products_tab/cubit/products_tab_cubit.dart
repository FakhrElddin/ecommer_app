import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_products_use_casse.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/products_tab_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsTabCubit extends Cubit<ProductsTabStates> {
  ProductsTabCubit({required this.getAllProductsUseCasse})
    : super(ProductsTabInitialState());
  GetAllProductsUseCasse getAllProductsUseCasse;

  void getAllProducts() async {
    emit(ProductsTabLoadingState());
    var either = await getAllProductsUseCasse.invoke();
    either.fold(
      (failure) => emit(ProductsTabErrorState(failure: failure)),
      (response) =>
          emit(ProductsTabSuccessState(productsResponseEntity: response)),
    );
  }
}
