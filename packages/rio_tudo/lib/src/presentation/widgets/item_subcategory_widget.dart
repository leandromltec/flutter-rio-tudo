import 'package:cached_network_image/cached_network_image.dart';
import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../../domain/entities/subcategory_entity.dart';

class ItemSubCategoryWidget extends StatefulWidget {
  SubCategoryEntity subCategory;

  ItemSubCategoryWidget({required this.subCategory});

  @override
  State<ItemSubCategoryWidget> createState() => _ItemSubCategoryWidgetState();
}

class _ItemSubCategoryWidgetState extends State<ItemSubCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    /*return InkWell(
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
                          imageUrl: widget.subCategory.urlImage,
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
                    child: Flexible(
                        child: Text(widget.subCategory.title).nameCategory())),
              ],
            ),
          ),
        ));*/
    return Card(
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        width: 130,
        height: 330,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ],
            color: DesignSystemPaletterColorApp.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(100),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                      imageUrl: widget.subCategory.urlImage,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: DesignSystemPaletterColorApp.secondaryColorWhite,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )),
            ),
            //const Expanded(child: SizedBox()),
            Container(
              padding: const EdgeInsets.all(DesignSystemPaddingApp.pd8),
              width: MediaQuery.of(context).size.width,
              child: Text(widget.subCategory.title).titleCategory(),
              decoration: BoxDecoration(
                  color: DesignSystemPaletterColorApp.cardColor.withOpacity(1),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            )
          ],
        ),
      ),
      //),
    );
  }
}
