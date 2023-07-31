import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ItemCategoryWidget extends StatefulWidget {
  const ItemCategoryWidget({super.key});

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
                  padding: const EdgeInsets.only(bottom: DesignSystemPaddingApp.pd10),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(45),
                        child: Image.asset(
                          'assets/images/mirante.jpg',
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                
                 Container(
                  padding: const EdgeInsets.only(left: DesignSystemPaddingApp.pd6, right: DesignSystemPaddingApp.pd6),
                  child: const Text('Almoço com\n vista').nameCategory()),
              ],
            ),
          ),
        ));
  }
}
