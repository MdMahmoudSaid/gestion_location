import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Translationcontrller extends GetxController {
  changelangue(String codel) {
    Locale locale = Locale(codel);
    Get.updateLocale(locale);
  }
}
