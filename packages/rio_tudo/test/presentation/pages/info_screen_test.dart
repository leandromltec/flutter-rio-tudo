import 'dart:io';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';

import '../../mock/domain/usecases/api_get_info_usecases_mock.dart';
import '../../mock/mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ValueNotifierInfoPresenter? presenter;
  ValueNotifierInfoPresenter? presenterNotInfo;
  ValueNotifierInfoPresenter? presenterError;
  GetInfoMock? getInfoMock;

  setUp(() async {
    getInfoMock = GetInfoMock();

    getInfoMock!.mockResponse(MockListInfoEntity.mockInfoEntity());

    presenter = ValueNotifierInfoPresenter(getInfo: getInfoMock!);
  });

  setUpAll(() {
    //HttpOverrides.global = null;

    makeInfoScreen();
  });

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: InfoScreen(
        presenterInfo: presenter!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageNotInfo(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: InfoScreen(
        presenterInfo: presenterNotInfo!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageError(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: InfoScreen(
        presenterInfo: presenterError!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  testWidgets('Test Info Screen', (tester) async {
    await loadPage(tester);
    await tester.pump(const Duration(seconds: 1));

    expect(find.text(LabelsApp.titleListImages), findsOneWidget);

    GestureDetector? gestureDetectorButton() =>
        find.byKey(Key('gesture_copy_contact')).evaluate().first.widget
            as GestureDetector;

    gestureDetectorButton()!.onTap!();

    await tester.pumpAndSettle();

    InkWell? inkWellButton() =>
        find.byKey(Key('button_link_open_image')).evaluate().first.widget
            as InkWell;

    inkWellButton()!.onTap!();

    await tester.pumpAndSettle();
  });

  testWidgets('Test Info Screen with Not Infos', (tester) async {
    getInfoMock!.mockResponse(MockListInfoEntity.mockInfoEntityEmptyInfo());

    presenterNotInfo = ValueNotifierInfoPresenter(getInfo: getInfoMock);

    await loadPageNotInfo(tester);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Test Info Screen with Error', (tester) async {
    getInfoMock!.mockResponse(null);

    presenterError = ValueNotifierInfoPresenter(getInfo: null);

    await loadPageError(tester);
    await tester.pump(const Duration(seconds: 1));
  });
}
