import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
    update();
  }
}
