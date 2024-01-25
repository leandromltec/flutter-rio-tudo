import 'package:cached_network_image/cached_network_image.dart';
import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../rio_tudo.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/entities/subcategory_entity.dart';
import 'package:config/src/service_locator/injector_getit.dart';

class ItemSubCategoryWidget extends StatefulWidget {
  SubCategoryEntity subCategory;

  ItemSubCategoryWidget({required this.subCategory});

  @override
  State<ItemSubCategoryWidget> createState() => _ItemSubCategoryWidgetState();
}

class _ItemSubCategoryWidgetState extends State<ItemSubCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        InjectorGetIt.instance
                .get<HomeScreenPresenter>()
                .idSubCategorySelected =
            ValueNotifier(widget.subCategory.idSubCategory);

        InjectorGetIt.instance
            .get<HomeScreenPresenter>()
            .titleSubCategorySelected = ValueNotifier(widget.subCategory.title);

        Navigator.of(context).pushNamed(RoutesApp.SubCategoryScreen);
      },
      child: Card(
        elevation: 0,
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          width: 120,
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
                          color:
                              DesignSystemPaletterColorApp.secondaryColorWhite,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(DesignSystemPaddingApp.pd8),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:
                        DesignSystemPaletterColorApp.cardColor.withOpacity(1),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text(widget.subCategory.title).titleCategory(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
