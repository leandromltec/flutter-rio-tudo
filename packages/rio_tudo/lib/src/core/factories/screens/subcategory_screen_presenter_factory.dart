import '../../../presentation/value_notifier/value_notifier.dart';
import '../usecases/usecases_factories.dart';

makeSubCategoryPresenter() => ValueNotifierSubCategoryPresenter(
    getSubCategorySelected: makeGetSubCategory());
