/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import '../../../../rio_tudo.dart';
import '../../../presentation/value_notifier/value_notifier.dart';
import '../usecases/get_all_categories_factory.dart';

HomeScreenPresenter makeHomePresenter() =>
    ValueNotifierHomePresenter(getAllCategories: makeGetAllCategories());
