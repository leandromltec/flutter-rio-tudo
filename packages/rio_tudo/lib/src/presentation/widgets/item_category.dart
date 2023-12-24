import 'package:cached_network_image/cached_network_image.dart';
import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_entity.dart';

class ItemCategoryWidget extends StatefulWidget {
  CategoryEntity itemCategory;

  ItemCategoryWidget({required this.itemCategory});

  @override
  State<ItemCategoryWidget> createState() => _ItemCategoryWidgetState();
}

class _ItemCategoryWidgetState extends State<ItemCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(DesignSystemPaddingApp.pd10),
          child: Container(
            padding: const EdgeInsets.only(bottom: DesignSystemPaddingApp.pd10),
            height: 400,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),
                ],
                color: DesignSystemPaletterColorApp.secondaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  /*padding: const EdgeInsets.only(
                      bottom: DesignSystemPaddingApp.pd10),*/
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(60),
                        child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          alignment: Alignment.topCenter,
                          imageUrl: widget.itemCategory.urlImage,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            color: DesignSystemPaletterColorApp
                                .secondaryColorWhite,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                ),
                Container(
                    child: Text(widget.itemCategory.title).nameCategory()),
              ],
            ),
          ),
        ));
  }
}
