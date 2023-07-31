import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'widgets.dart';

/// Caso o parâmetro milliseconds não seja definido, não tera animação
/// If the milliseconds parameter is not defined, there will be no animation
// ignore: must_be_immutable
class MenuCategory extends StatefulWidget {
  final BuildContext context;
  final dynamic listItem;
  final double? horizontalOffset;
  int milliseconds = 0;

  MenuCategory(
      {super.key,
      required this.context,
      required this.listItem,
      this.horizontalOffset,
      required this.milliseconds});

  @override
  State<MenuCategory> createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: ((context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: widget.milliseconds),
            child: SlideAnimation(
              horizontalOffset: widget.horizontalOffset,
              child: const FadeInAnimation(
                child: ItemCategoryWidget(),
              ),
            ),
          );
        }),
      ),
    );
  }
}
