/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rio_tudo/src/presentation/ui/widgets/widgets.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class CardItemNoSubtitle extends StatefulWidget {
  final String title;
  final String link;

  // ignore: use_key_in_widget_constructors
  const CardItemNoSubtitle({required this.title, required this.link});

  @override
  State<CardItemNoSubtitle> createState() => _CardItemNoSubtitleState();
}

class _CardItemNoSubtitleState extends State<CardItemNoSubtitle> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
          margin: const EdgeInsets.fromLTRB(
              DesignSystemPaddingApp.pd8,
              DesignSystemPaddingApp.pd4,
              DesignSystemPaddingApp.pd8,
              DesignSystemPaddingApp.pd8),
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ],
              color: DesignSystemPaletterColorApp.cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.fromLTRB(
                                DesignSystemPaddingApp.pd10,
                                DesignSystemPaddingApp.pd10,
                                DesignSystemPaddingApp.pd6,
                                DesignSystemPaddingApp.pd6),
                            child: Text(widget.title).titleTipCard(),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              right: DesignSystemPaddingApp.pd10),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
                  decoration: const BoxDecoration(
                      color: DesignSystemPaletterColorApp.cardColorButtonLink,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/icon_instagram.svg',
                        semanticsLabel: LabelsApp.labelInstagram,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                        width: 40,
                        height: 40,
                      ),
                      Text(
                        LabelsApp.textButtonSeeInstagram,
                        textAlign: TextAlign.center,
                      ).textButtonSeeInstagram(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
