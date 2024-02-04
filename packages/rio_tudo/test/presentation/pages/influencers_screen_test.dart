import 'dart:io';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';

import '../../mock/mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ValueNotifierInfluencerPresenter? presenter;
  ValueNotifierInfluencerPresenter? presenterError;

  GetInfluencersMock? getInfluencersMock;

  setUp(() {
    getInfluencersMock = GetInfluencersMock();

    getInfluencersMock!
        .mockResponse(MockListInfluencerEntity.mockListInfluencerEntity());

    presenter =
        ValueNotifierInfluencerPresenter(getInfluencers: getInfluencersMock!);
  });

  setUpAll(() {
    //HttpOverrides.global = null;

    makeInfluencerScreen();

    /*InjectorGetIt.instance
        .registerLazySingleton<InfluencerPresenter>(makeInfluencerPresenter());*/
  });

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: InfluencersScreen(
        presenterInfluencer: presenter!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageError(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: InfluencersScreen(
        presenterInfluencer: presenterError!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  testWidgets('Test Influencer Screen', (tester) async {
    await loadPage(tester);
    await tester.pump(const Duration(seconds: 1));

    expect(find.text(LabelsApp.influencersText), findsOneWidget);
  });

  testWidgets('test Influencer Screen with Error', (tester) async {
    getInfluencersMock!.mockResponse(null);

    presenterError = ValueNotifierInfluencerPresenter(getInfluencers: null);

    await loadPageError(tester);
    await tester.pump(const Duration(seconds: 1));
  });
}
