import 'package:get/get.dart';

class Bottomcontroller extends GetxController {
  var index = 0;
  changeIndex(var i) {
    index = i;
    update();
  }
}
