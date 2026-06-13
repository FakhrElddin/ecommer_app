import 'package:ecommerce_app/domain/use_cases/delete_item_from_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_items_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_cart_item_quantity_use_case.dart';
import 'package:ecommerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartStates> {
  CartCubit({
    required this.getCartItemsUseCase,
    required this.deleteItemFromCartUseCase,
    required this.updateCartItemQuantityUseCase,
  }) : super(CartInitialState());
  GetCartItemsUseCase getCartItemsUseCase;
  DeleteItemFromCartUseCase deleteItemFromCartUseCase;
  UpdateCartItemQuantityUseCase updateCartItemQuantityUseCase;

  int numberOfCartItems = 0;

  static CartCubit get(BuildContext context) =>
      BlocProvider.of<CartCubit>(context);

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

  void deleteCartItem({required String productId}) async {
    var either = await deleteItemFromCartUseCase.invoke(productId: productId);
    either.fold((failure) => emit(DeleteCartItemErrorState(failure: failure)), (
      response,
    ) {
      numberOfCartItems = response.numOfCartItems!.toInt();
      return emit(GetCartItemsSuccessState(getCartResponseEntity: response));
    });
  }

  void updateCartItemQuantity({
    required String productId,
    required int count,
  }) async {
    var either = await updateCartItemQuantityUseCase.invoke(
      productId: productId,
      count: count,
    );
    either.fold((failure) => emit(UpdateCartItemErrorState(failure: failure)), (
      response,
    ) {
      numberOfCartItems = response.numOfCartItems!.toInt();
      return emit(GetCartItemsSuccessState(getCartResponseEntity: response));
    });
  }
}
