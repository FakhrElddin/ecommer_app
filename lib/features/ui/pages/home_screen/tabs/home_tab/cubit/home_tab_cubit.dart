import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitState());
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  void getAllCategories() async {
    emit(HomeTabCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (failure) => emit(HomeTabCategoriesErrorState(failure: failure)),
      (response) => emit(
        HomeTabCategoriesSuccessState(categoriesResponseEntity: response),
      ),
    );
  }

  void getAllBrands() async {
    emit(HomeTabBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (failure) => emit(HomeTabBrandsErrorState(failure: failure)),
      (response) =>
          emit(HomeTabBrandsSuccessState(brandsResponseEntity: response)),
    );
  }
}
