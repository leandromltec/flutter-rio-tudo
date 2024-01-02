import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:config/src/service_locator/injector_getit.dart';
import '../../../domain/entities/entities.dart';
import '../../widgets/widgets.dart';
import '../base_screen.dart';
import '../screens.dart';

class SubCategoryScreen extends StatefulWidget {
  final SubCategoryPresenter? presenterSubCategory;
  final HomeScreenPresenter? presenterHomeScreen;

  // ignore: use_key_in_widget_constructors
  const SubCategoryScreen(
      {this.presenterSubCategory, this.presenterHomeScreen});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    widget.presenterSubCategory!.init();

    await widget.presenterSubCategory!.getItemsSubCategory(
        idSubCategorySelected: InjectorGetIt.instance
            .get<HomeScreenPresenter>()
            .idSubCategorySelected!
            .value);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      indexBottomNavigator: 4,
      state: widget.presenterSubCategory!.state,
      widgetScreen: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(DesignSystemPaddingApp.pd10),
              child: FieldSearch()),
          BaseContent(
            widgetContent: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(DesignSystemPaddingApp.pd8),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _containerTitleCategory(
                          widgetChild: TitleCategory(
                        titleCategory: 'Almoço com vista',
                      )),
                      _containerButton(
                          widgetChild: ButtonText(
                        textButton: LabelsApp.textButtonSeeAll,
                      )),
                    ],
                  ),
                  ValueListenableBuilder(
                      valueListenable: widget.presenterSubCategory!
                          .listItemsSubCategoriesNotifier!,
                      builder: (_, __, ___) {
                        if (widget.presenterSubCategory!
                                .listItemsSubCategoriesNotifier!.value !=
                            null) {
                          return SingleChildScrollView(
                            child: _listViewItemsSubCategory(
                                listItemsSubCategory: widget
                                    .presenterSubCategory!
                                    .listItemsSubCategoriesNotifier!
                                    .value!),
                          );
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
  }

  Widget _containerTitleCategory({required Widget widgetChild}) {
    return Container(
        margin: const EdgeInsets.only(
            left: DesignSystemPaddingApp.pd24,
            top: DesignSystemPaddingApp.pd10),
        child: widgetChild);
  }

  Widget _containerButton({required Widget widgetChild}) {
    return Container(
        margin: const EdgeInsets.only(right: DesignSystemPaddingApp.pd10),
        child: widgetChild);
  }

  Widget _listViewItemsSubCategory(
      {required List<ItemSubCategoryEntity> listItemsSubCategory}) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listItemsSubCategory.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: Duration(milliseconds: 1500),
          child: SlideAnimation(
            verticalOffset: 300,
            child: FadeInAnimation(
              child: CardItem(
                itemSubCategory: listItemsSubCategory[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}
