import 'package:rio_tudo/src/core/factories/screens/subcategory_screen_presenter_factory.dart';

import '../../../presentation/screen/screens.dart';

makeSubCategoryScreen() => SubCategoryScreen(
      presenterSubCategory: makeSubCategoryPresenter(),
    );
