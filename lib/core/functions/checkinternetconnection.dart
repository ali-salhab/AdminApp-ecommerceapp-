import 'dart:io';

checkinternetstatus() async {
  try {
    var result = await InternetAddress.lookup('www.google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("cheched internet return true");
      return true;
    }
  } on SocketException catch (_) {
    print("cheched internet return false");

    return false;
  }
}
