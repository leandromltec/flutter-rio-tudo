import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:package_info_plus/package_info_plus.dart';
import 'package:rio_tudo/src/presentation/screen/base_screen.dart';
import 'package:rio_tudo/src/presentation/widgets/widgets.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

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
    //_initPackageInfo();
    super.initState();
  }

  /*Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
        indexBottomNavigator: 3,
        widgetScreen: Column(
          children: [
            BaseContent(
                widgetContent: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(DesignSystemPaddingApp.pd12),
                child: Column(
                  children: [
                    Text('Informações').titleInfoScreen(),
                    SizedBox(
                      height: 10,
                    ),
                    paddingText(
                      doublePadding: 10.0,
                      text: Text(
                              'O Rio Tudo é um aplicativo para celuar que tem o objetivo de reunir dicas sobre coisas pra fazer na cidade do Rio de Janeiro.\nNa tela principal (home), você pode selecionar sua dica seguindo uma categoria como por exemplo Almoço com Vista.')
                          .textInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 20.0,
                      text: Text(
                              'Ao acessar a tela de busca de dicas, você poderá compartilhar, favoritar e ao tocar em Ver Instagram, vc será redirecionado para página da dica onde pode ver informações como contato, endereço, etc.')
                          .textInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 20.0,
                      text: Text(
                        'OBS: todos as informações como valores, horários, entre outras, são de responsabilidade de cada estabelecimento.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).textInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 10.0,
                      text: Text('Desenvolvimento').titleInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 10.0,
                      text: Text(
                              'Aplicativo desenvolvido com a tecnologia Flutter para front-end e NodeJs para backend.')
                          .textInfoScreen(),
                    ),
                    Text('2023 Todos os direitos reservados').textInfoScreen(),
                    paddingText(
                      doublePadding: 40.0,
                      text: Text('Versão: 1.0.0').textInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 20.0,
                      text: Text(
                        'Desenvolvido por Leandro Loureiro',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).textInfoScreen(),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/perfil.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    paddingText(
                      doublePadding: 10.0,
                      text: Text(
                        'Desenvolvedor Web desde 2012 e mobile desde 2018. Formado no curso superior de tecnologia no ISTCCP, pós graduado em engenharia de software e desenvolvimento mobile.',
                      ).textInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 20.0,
                      text: Text(
                        'Possui mais de 10 mil alunos na plataforma Udemy, ministrando diversos cursos de desenvolvimento de software. Atualmente atuando como desenvolvedor de aplicativos para bancos digitais.',
                      ).textInfoScreen(),
                    ),
                    paddingText(
                      doublePadding: 10.0,
                      text: Text('Contato').titleInfoScreen(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'riotudo@gmail.com',
                        ).textInfoScreen(
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: 'teste'))
                                  .then((value) => {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('E-mail Copiado !')))
                                      });
                            },
                            child: Icon(Icons.copy)),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ));
  }

  Widget paddingText({required double doublePadding, required Text text}) {
    return Padding(
        padding: EdgeInsets.only(bottom: doublePadding), child: text);
  }
}
