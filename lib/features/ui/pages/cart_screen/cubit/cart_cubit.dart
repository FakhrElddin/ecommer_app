import 'package:ecommerce_app/domain/use_cases/get_cart_items_use_case.dart';
import 'package:ecommerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartStates> {
  CartCubit({required this.getCartItemsUseCase}) : super(CartInitialState());
  GetCartItemsUseCase getCartItemsUseCase;

  int numberOfCartItems = 0;

  static CartCubit get(BuildContext context) => BlocProvider.of<CartCubit>(context);

  void getCartItems() async {
    emit(GetCartItemsLoadingState());
    var either = await getCartItemsUseCase.invoke();
    either.fold((failure) => emit(GetCartItemsErrorState(failure: failure)), (
      response,
    ) {
      numberOfCartItems = response.numOfCartItems!.toInt();
      return emit(GetCartItemsSuccessState(getCartResponseEntity: response));
    });
  }

}
