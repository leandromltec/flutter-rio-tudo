import '../usecases/usecases_factories.dart';
import '../../../presentation/value_notifier/value_notifier.dart';

makeInfoPresenter() => ValueNotifierInfoPresenter(getInfo: makeGetInfo());
