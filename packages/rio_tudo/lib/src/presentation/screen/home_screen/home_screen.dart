import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../rio_tudo.dart';
import '../../../domain/entities/entities.dart';
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
  void dispose() {
    widget.presenterHomeScreen!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.presenterHomeScreen!.state!,
      builder: (_, __, ___) {
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
                    padding: const EdgeInsets.all(DesignSystemPaddingApp.pd16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                    onPressedFunction: () {},
                                  ))
                            ],
                          ),
                          _containerLastTipVisited(),
                          const DividerApp(),
                          ValueListenableBuilder(
                              valueListenable: widget.presenterHomeScreen!
                                  .listAllCategoriesNotifier!,
                              builder: (_, __, ___) {
                                if (widget.presenterHomeScreen!
                                        .listAllCategoriesNotifier!.value !=
                                    null) {
                                  return _getListWidgetsCategorySubCategory(
                                      listCategory: widget.presenterHomeScreen!
                                          .listAllCategoriesNotifier!.value!);
                                } else {
                                  return const SizedBox();
                                }
                              }),
                        ]),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _getListWidgetsCategorySubCategory(
      {required List<CategoryEntity> listCategory}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...listCategory.map((category) => Column(
              children: [
                _containerTitleCategory(
                    widgetChild: TitleCategory(
                  titleCategory: category.title,
                )),
                _containerSubCategoryMenu(
                  widgetChild: SubCategoryMenu(
                      listItemSubCategory: category.subCategory,
                      context: context,
                      horizontalOffset: 300,
                      milliseconds: 1500),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            )),
      ],
    );
  }

  Widget _containerLastTipVisited() {
    ItemSubCategoryEntity? itemSubCategory = ItemSubCategoryEntity();
    itemSubCategory!.district = 'Ipanema';
    itemSubCategory.titleTip = 'Ultimo visitado';
    itemSubCategory.urlInstagram = 'url';

    return Container(
      //padding: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
      child: CardItem(
        itemSubCategory: itemSubCategory,
      ),
    );
  }

  Widget _containerTitleCategory({required Widget widgetChild}) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
            left: DesignSystemPaddingApp.pd10, top: DesignSystemPaddingApp.pd6),
        child: widgetChild);
  }

  Widget _containerSubCategoryMenu({required Widget widgetChild}) {
    return Container(
      //width: MediaQuery.of(context).size.width,

      padding: const EdgeInsets.fromLTRB(DesignSystemPaddingApp.pd4,
          DesignSystemPaddingApp.pd6, 0, DesignSystemPaddingApp.pd4),
      height: 200,
      child: widgetChild,
    );
  }
}
