import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rio_tudo/src/presentation/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class CardItemNoSubtitle extends StatefulWidget {
  String? urlRedirect;
  CardItemNoSubtitle({super.key, this.urlRedirect});

  @override
  State<CardItemNoSubtitle> createState() => _CardItemNoSubtitleState();
}

class _CardItemNoSubtitleState extends State<CardItemNoSubtitle> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
          margin: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ],
              color: DesignSystemPaletterColorApp.cardColorNoSubtitle,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.all(DesignSystemPaddingApp.pd10),
                    child: Text(
                      "Teste",
                      style: TextStyle(
                          fontSize: 16,
                          color: DesignSystemPaletterColorApp.fontPrimaryColor),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: DesignSystemPaddingApp.pd10),
                child: Row(
                  children: [
                    ButtonShare(
                      onTapShare: null,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ButtonFavorite(
                      onTapFavorite: null,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    openUrl(urlString: widget.urlRedirect!);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
                    decoration: const BoxDecoration(
                        color: DesignSystemPaletterColorApp
                            .cardColorButtonLinkNoSubtitle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/icon_instagram.svg',
                          semanticsLabel: 'Instagram',
                          color: Colors.white,
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          LabelsApp.textButtonSeeInstagram,
                          textAlign: TextAlign.center,
                        ).subTitleTipCard(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
      //),
    );
  }

  Future<void> openUrl({required String urlString}) async {
    try {
      if (await canLaunchUrl(Uri.parse(urlString))) {
        await launchUrl(Uri.parse(urlString),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      await launchUrl(Uri(scheme: 'http', path: urlString),
          mode: LaunchMode.externalApplication);
    }
  }
}
