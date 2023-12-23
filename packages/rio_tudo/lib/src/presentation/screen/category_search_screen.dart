import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'base_screen.dart';

class CategorySearchScreen extends StatefulWidget {
  const CategorySearchScreen({super.key});

  @override
  State<CategorySearchScreen> createState() => _CategorySearchScreenState();
}

class _CategorySearchScreenState extends State<CategorySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      indexBottomNavigator: 4,
      widgetScreen: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(DesignSystemPaddingApp.pd10),
              child: FieldSearch()),
          BaseContent(
            widgetContent: Column(children: [
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
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        CardItem(),
                        CardItem(),
                        CardItem(),
                        CardItem(),
                        CardItem(),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
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
}
