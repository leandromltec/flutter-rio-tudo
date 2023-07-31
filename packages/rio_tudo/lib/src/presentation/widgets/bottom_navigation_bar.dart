import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatefulWidget {
  int indexScreen;
  BottomNavigationBarApp({Key? key, required this.indexScreen}) : super(key: key);

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp>
    with SingleTickerProviderStateMixin {
  
Widget _tabItem(Widget child,
      {required String label, required int index, required Function onTap}) {
    return GestureDetector(
      onTap: onTap as void Function(),
      child: Container(
          height: 50,
          width: 80,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
          decoration: widget.indexScreen != index
              ? null
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.indexScreen == index ? DesignSystemPaletterColorApp.secondaryColor : null,
                ),
          child: Column(
            children: [
              child,
              Flexible(child: Text(label).labelBottomNavigator()),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(DesignSystemPaddingApp.pd8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(DesignSystemPaddingApp.pd20),
          child: Container(
              color: DesignSystemPaletterColorApp.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _tabItem(
                    Icon(
                      Icons.home_outlined,
                      color: DesignSystemPaletterColorApp.secondaryColorWhite,
                    ),
                    label: LabelsApp.labelBottomNavigatonHome,
                    index: 0,
                    onTap: () {
                      if(widget.indexScreen == 0) return;
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    },
                  ),
                  _tabItem(
                    Icon(
                      Icons.group,
                      color: DesignSystemPaletterColorApp.secondaryColorWhite,
                    ),
                    label: LabelsApp.labelBottomNavigatonInfluencers,
                    index:  1,
                    onTap: () {
                     if(widget.indexScreen == 1) return;
                      Navigator.pushNamed(context, RoutesApp.InfluencerScreen);
                    },
                  ),
                  _tabItem(
                    Icon(
                      Icons.favorite,
                      color: DesignSystemPaletterColorApp.secondaryColorWhite,
                    ),
                    label: LabelsApp.labelBottomNavigatonFavoritos,
                    index: 2,
                    onTap: () {
                      if(widget.indexScreen == 2) return;
                      Navigator.pushNamed(context, RoutesApp.FavoriteScreen);
                    },
                  ),
                ],
              )
             
              ),
        ),
      ),
    );
  }

}
