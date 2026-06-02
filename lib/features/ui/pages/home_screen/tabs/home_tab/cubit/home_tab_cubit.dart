import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit({required this.getAllCategoriesUseCase})
    : super(HomeTabInitState());
  GetAllCategoriesUseCase getAllCategoriesUseCase;

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
}
