import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';


import '../widgets/widgets.dart';
import 'base_screen.dart';

class InfluencersScreen extends StatefulWidget {
  const InfluencersScreen({super.key});

  @override
  State<InfluencersScreen> createState() => _InfluencersScreenState();
}

class _InfluencersScreenState extends State<InfluencersScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      indexBottomNavigator: 1,
      widgetScreen: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystemPaddingApp.pd20),
            child: Text(
             LabelsApp.influencersText,).textTopPage(),
          ),
          BaseContent(widgetContent:  Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(DesignSystemPaddingApp.pd10, DesignSystemPaddingApp.pd6, DesignSystemPaddingApp.pd10, DesignSystemPaddingApp.pd4),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CardItemNoSubtitle(urlRedirect: 'https://instagram.com/ianoliveira.dev'),
                    CardItemNoSubtitle(),
                    CardItemNoSubtitle(),
                    CardItemNoSubtitle(),
                    CardItemNoSubtitle(),
                     CardItemNoSubtitle(),
                      CardItemNoSubtitle(),
                       CardItemNoSubtitle(),
                  ],
                ),
              ),
            ),)
          
        ],
      ),
    );
  }

}
