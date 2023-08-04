import 'package:get/get.dart';

validate(String val, int min, int max, String type) {
  if (type == 'email') {
    if (!GetUtils.isEmail(val.trim())) {
      return 'invalid email';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'invalid phone number ';
    }
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'invalid username ';
    }
  }
  if (val.isEmpty) {
    return 'field cant be empty';
  }
  if (val.length > max) {
    return 'value length cant be bigger than $max';
  }
  if (val.length < min) {
    return 'value length cant be less than $min';
  }
}
