import '../../../presentation/screen/screens.dart';
import 'screens_factories.dart';

makeSubCategoryScreen() => SubCategoryScreen(
      presenterSubCategory: makeSubCategoryPresenter(),
    );
