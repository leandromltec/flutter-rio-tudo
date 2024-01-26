/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:package_info_plus/package_info_plus.dart';

import '../../data.dart';

class PackageInfoApp extends PackageInfoAppInterface {
  @override
  Future<PackageInfo>? getPackageInfoApp() async {
    PackageInfo? packageInfoApp;
    try {
      packageInfoApp = await PackageInfo.fromPlatform();
    } catch (e) {
      packageInfoApp = null;
    }

    return packageInfoApp!;
  }
}
