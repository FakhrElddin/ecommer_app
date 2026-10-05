import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/features/ui/pages/product_details_screen/cubit/product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitState());
  int productCounter = 0;
  int selectedColor = -1;
  int selectedSize = -1;
  int imageIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  void decreaseProductCounter() {
    if (productCounter > 0) {
      productCounter--;
      emit(ProductDetailsDecreaseProductCounterState());
    }
  }

  void increaseProductCounter({required int quantity}) {
    if (productCounter < quantity) {
      productCounter++;
      emit(ProductDetailsIncreaseProductCounterState());
    }
  }

  void changeSelectedSize({required int index}) {
    if (selectedSize != index) {
      selectedSize = index;
      emit(ProductDetailsChangeSelectedSizeState());
    }
  }

  void changeSelectedColor({required int index}) {
    if (selectedColor != index) {
      selectedColor = index;
      emit(ProductDetailsChangeSelectedColorState());
    }
  }

  void changeImageIndex({required int index}) {
    imageIndex = index;
    emit(ProductDetailsChangeImageIndexState());
  }
}
