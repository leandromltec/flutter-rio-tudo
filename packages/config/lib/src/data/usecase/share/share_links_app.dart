import 'dart:async';

import 'package:uni_links/uni_links.dart';

import '../../../../config.dart';

class ShareLink extends ShareAppInterface {
  @override
  Future<void> handlerUri(String tip) async {
    dynamic refCode = '';

    late StreamSubscription subscription;

    final uri = await getInitialUri();

    if (uri != null) {
      print('url ' + uri.toString() + tip);
      setCodeFromUri(uri, refCode);
    }

    uriLinkStream.listen((event) {});
  }

  setCodeFromUri(Uri uri, dynamic refCode) {
    refCode = uri.queryParameters["dica"];
  }
}
