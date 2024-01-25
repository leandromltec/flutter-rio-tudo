import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../domain/entities/entities.dart';
import 'widgets.dart';

/// Caso o parâmetro milliseconds não seja definido, não tera animação
/// If the milliseconds parameter is not defined, there will be no animation
// ignore: must_be_immutable
class SubCategoryMenu extends StatefulWidget {
  final BuildContext context;
  final List<SubCategoryEntity>? listItemSubCategory;
  final double? horizontalOffset;
  int milliseconds = 0;

  SubCategoryMenu(
      {super.key,
      required this.context,
      required this.listItemSubCategory,
      this.horizontalOffset,
      required this.milliseconds});

  @override
  State<SubCategoryMenu> createState() => _SubCategoryMenuState();
}

class _SubCategoryMenuState extends State<SubCategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.listItemSubCategory!.length,
        itemBuilder: ((context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: widget.milliseconds),
            child: SlideAnimation(
              horizontalOffset: widget.horizontalOffset,
              child: FadeInAnimation(
                child: ItemSubCategoryWidget(
                    subCategory: widget.listItemSubCategory![index]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
