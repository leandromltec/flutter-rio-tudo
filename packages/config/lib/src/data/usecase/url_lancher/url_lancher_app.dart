/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data.dart';

class UrlLancher implements UrlLancherInterface {
  @override
  Future<void> openUrl({required String urlString}) async {
    if (await launchUrl(Uri.parse(urlString))) {
      await launchUrlString(
        urlString,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
