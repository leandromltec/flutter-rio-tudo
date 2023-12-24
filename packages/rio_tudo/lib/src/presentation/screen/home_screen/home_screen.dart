import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../rio_tudo.dart';
import '../../widgets/widgets.dart';
import '../base_screen.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenPresenter? presenterHomeScreen;

  HomeScreen({this.presenterHomeScreen});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    widget.presenterHomeScreen!.init();
    await widget.presenterHomeScreen!.getListCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      state: widget.presenterHomeScreen!.state,
      indexBottomNavigator: 0,
      widgetScreen: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystemPaddingApp.pd20),
            child: Text(LabelsApp.homeText).textTopPage(),
          ),
          BaseContent(
            widgetContent: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(DesignSystemPaddingApp.pd8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _containerTitleCategory(
                              widgetChild: TitleCategory(
                            titleCategory: LabelsApp.titleLastVisitedTip,
                          )),
                          Container(
                              margin: const EdgeInsets.only(
                                  right: DesignSystemPaddingApp.pd10),
                              child: ButtonText(
                                textButton: LabelsApp.textButtonCleanFilter,
                              ))
                        ],
                      ),
                      _containerLastTipVisited(widgetChild: CardItem()),
                      const DividerApp(),
                      _containerTitleCategory(
                          widgetChild: TitleCategory(
                        titleCategory: 'Vistas',
                      )),
                      ValueListenableBuilder(
                          valueListenable: widget
                              .presenterHomeScreen!.listAllCategoriesNotifier!,
                          builder: (_, __, ___) {
                            if (widget.presenterHomeScreen!
                                    .listAllCategoriesNotifier!.value !=
                                null) {
                              return _containerMenuCategory(
                                widgetChild: MenuCategory(
                                    listItem: widget.presenterHomeScreen!
                                        .listAllCategoriesNotifier!.value,
                                    context: context,
                                    horizontalOffset: 300,
                                    milliseconds: 1500),
                              );
                            } else {
                              return SizedBox();
                            }
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      /*_containerTitleCategory(
                          widgetChild: TitleCategory(
                        titleCategory: 'Comida',
                      )),
                      _containerMenuCategory(
                        widgetChild: MenuCategory(
                            listItem: null,
                            context: context,
                            horizontalOffset: 600,
                            milliseconds: 1500),
                      ),
                      _containerTitleCategory(
                          widgetChild: TitleCategory(
                        titleCategory: 'Bares',
                      )),
                      _containerMenuCategory(
                        widgetChild: MenuCategory(
                            listItem: null,
                            context: context,
                            horizontalOffset: 1200,
                            milliseconds: 1500),
                      ),*/
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _containerLastTipVisited({required Widget widgetChild}) {
    return Container(
      //padding: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
      child: CardItem(),
    );
  }

  Widget _containerTitleCategory({required Widget widgetChild}) {
    return Container(
        margin: const EdgeInsets.only(
            left: DesignSystemPaddingApp.pd12, top: DesignSystemPaddingApp.pd6),
        child: widgetChild);
  }

  Widget _containerMenuCategory({required Widget widgetChild}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(DesignSystemPaddingApp.pd4,
          DesignSystemPaddingApp.pd6, 0, DesignSystemPaddingApp.pd4),
      height: 180,
      child: widgetChild,
    );
  }
}
