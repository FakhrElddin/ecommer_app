import 'package:ecommerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_products_use_casse.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/products_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsTabCubit extends Cubit<ProductsTabStates> {
  ProductsTabCubit({required this.getAllProductsUseCasse, required this.addToCartUseCase})
    : super(ProductsTabInitialState());
  GetAllProductsUseCasse getAllProductsUseCasse;
  AddToCartUseCase addToCartUseCase;

  int numberOfCartItems = 0;

  static ProductsTabCubit get(BuildContext context) => BlocProvider.of<ProductsTabCubit>(context);

  void getAllProducts() async {
    emit(ProductsTabLoadingState());
    var either = await getAllProductsUseCasse.invoke();
    either.fold(
      (failure) => emit(ProductsTabErrorState(failure: failure)),
      (response) =>
          emit(ProductsTabSuccessState(productsResponseEntity: response)),
    );
  }

  void addToCart({required String productId}) async{
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId: productId);
    either.fold(
          (failure) => emit(AddToCartErrorState(failure: failure)),
          (response) {
            numberOfCartItems = response.numOfCartItems!.toInt();
            emit(AddToCartSuccessState(addCartResponseEntity: response));
          }
          ,
    );
  }
}
