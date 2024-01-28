/*import 'package:share_plus/share_plus.dart';

abstract class ShareAppInterface{
    Future <void> shareItem({required String textShare}) async{
      await Share.share(textShare);

    }
}*/

abstract class ShareAppInterface {
  Future<void> handlerUri(String tip);
}
