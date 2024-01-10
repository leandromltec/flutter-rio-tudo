import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:package_info_plus/package_info_plus.dart';
import '../base_screen.dart';
import '../../widgets/widgets.dart';

import '../../../../rio_tudo.dart';
import '../../../domain/entities/entities.dart';

class InfoScreen extends StatefulWidget {
  final InfoPresenter presenterInfo;

  const InfoScreen({required this.presenterInfo});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  /*PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );*/

  @override
  void initState() {
    _loadData();
    //_initPackageInfo();
    super.initState();
  }

  _loadData() async {
    widget.presenterInfo.init();
    await widget.presenterInfo.getAllInfo();
  }

  /*Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.presenterInfo.state!,
        builder: (_, __, ___) {
          return BaseScreenWidget(
              state: widget.presenterInfo.state!,
              indexBottomNavigator: 3,
              widgetScreen: Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: widget.presenterInfo.infoEntityNotifier!,
                      builder: (_, info, ___) {
                        return BaseContent(
                            widgetContent: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(
                                DesignSystemPaddingApp.pd12),
                            child: Column(
                              children: [
                                if (info!.titleInfo != null ||
                                    info.titleInfo != '')
                                  _infoApp(info),
                                paddingText(
                                  doublePadding: 20.0,
                                  text: Text(
                                    info.observation!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ).textInfoScreen(),
                                ),
                                if (info.titleDev != null ||
                                    info.titleDev != '')
                                  _infoDev(info),
                                if (info.copyRights != null ||
                                    info.copyRights != '')
                                  Text(info.copyRights!).textInfoScreen(),
                                paddingText(
                                  doublePadding: 40.0,
                                  text: Text('Versão: 1.0.0').textInfoScreen(),
                                ),
                                if (info.developedBy != null ||
                                    info.developedBy != '')
                                  _infoDeveloper(info),
                                if (info.contact != null || info.contact != '')
                                  _infoContact(info),
                                if (info.listImages != null)
                                  _listImagesLinks(info),
                              ],
                            ),
                          ),
                        ));
                      }),
                ],
              ));
        });
  }

  Widget paddingText({required double doublePadding, required Text text}) {
    return Padding(
        padding: EdgeInsets.only(bottom: doublePadding), child: text);
  }

  Widget _infoApp(InfoEntity info) {
    return Column(
      children: [
        Text(info.titleInfo!).titleInfoScreen(),
        const SizedBox(
          height: 10,
        ),
        paddingText(
          doublePadding: 10.0,
          text: Text(info.firstDescription!).textInfoScreen(),
        ),
        paddingText(
          doublePadding: 20.0,
          text: Text(info.secondDescription!).textInfoScreen(),
        ),
      ],
    );
  }

  Widget _infoDev(InfoEntity info) {
    return Column(
      children: [
        paddingText(
          doublePadding: 10.0,
          text: Text(info.titleDev!).titleInfoScreen(),
        ),
        paddingText(
          doublePadding: 10.0,
          text: Text(info.devDescription!).textInfoScreen(),
        ),
      ],
    );
  }

  Widget _infoDeveloper(InfoEntity info) {
    return Column(
      children: [
        paddingText(
          doublePadding: 20.0,
          text: Text(
            info.developedBy!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ).textInfoScreen(),
        ),
        const SizedBox(
          height: 10,
        ),
        paddingText(
          doublePadding: 10.0,
          text: Text(info.firstDescriptionDev!).textInfoScreen(),
        ),
        paddingText(
          doublePadding: 20.0,
          text: Text(info.secondDescriptionDev!).textInfoScreen(),
        ),
      ],
    );
  }

  Widget _infoContact(InfoEntity info) {
    return Column(
      children: [
        paddingText(
          doublePadding: 10.0,
          text: Text(info.titleContact!).titleInfoScreen(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              info.contact!,
            ).textInfoScreen(
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () async {
                  await Clipboard.setData(const ClipboardData(text: 'contato'))
                      .then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(info.textSnackBarContact!)))
                          });
                },
                child: const Icon(Icons.copy)),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget _listImagesLinks(InfoEntity info) {
    return Column(
      children: [
        paddingText(
          doublePadding: 10.0,
          text: Text(
            LabelsApp.titleListImages,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ).textInfoScreen(),
        ),
        _listViewImagesLinks(info.listImages!)
      ],
    );
  }

  Widget _listViewImagesLinks(List<ImageEntity>? listImagesLink) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listImagesLink!.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            UrlLancher().openUrl(urlString: listImagesLink[index].urlImage!);
          },
          child: Text(listImagesLink[index].titleImage!),
        );
      }),
    );
  }
}
