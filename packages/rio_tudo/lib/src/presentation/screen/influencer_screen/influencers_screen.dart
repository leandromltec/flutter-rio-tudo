import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import '../screens.dart';

import '../../widgets/widgets.dart';
import '../base_screen.dart';

class InfluencersScreen extends StatefulWidget {
  final InfluencerPresenter presenterInfluencer;

  const InfluencersScreen({required this.presenterInfluencer});

  @override
  State<InfluencersScreen> createState() => _InfluencersScreenState();
}

class _InfluencersScreenState extends State<InfluencersScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    widget.presenterInfluencer.init();
    await widget.presenterInfluencer.getAllInfluencers();
  }

  @override
  void dispose() {
    widget.presenterInfluencer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.presenterInfluencer.state!,
      builder: (_, __, ___) {
        return BaseScreenWidget(
          state: widget.presenterInfluencer.state,
          indexBottomNavigator: 1,
          widgetScreen: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(DesignSystemPaddingApp.pd20),
                child: Text(
                  LabelsApp.influencersText,
                ).textTopPage(),
              ),
              BaseContent(
                widgetContent: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(
                      DesignSystemPaddingApp.pd10,
                      DesignSystemPaddingApp.pd6,
                      DesignSystemPaddingApp.pd10,
                      DesignSystemPaddingApp.pd4),
                  child: ValueListenableBuilder(
                      valueListenable:
                          widget.presenterInfluencer.listInfluencersNotifier!,
                      builder: (_, __, ___) {
                        return SingleChildScrollView(
                          child: _listViewItemsInfluencers(
                              listInfluencer: widget.presenterInfluencer
                                  .listInfluencersNotifier!.value!),
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _listViewItemsInfluencers(
      {required List<InfluencerEntity> listInfluencer}) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listInfluencer.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 1000),
          child: SlideAnimation(
            verticalOffset: 200,
            child: FadeInAnimation(
              child: CardItemNoSubtitle(
                title: listInfluencer[index].titleInfluencer,
                link: listInfluencer[index].urlLinkInfluencer,
              ),
            ),
          ),
        );
      }),
    );
  }
}
