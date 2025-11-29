import 'package:flutter/material.dart';
import 'package:gestion_locateur/BottomNavigation/BottomController.dart';
import 'package:gestion_locateur/maison/MaisonView.dart';
import 'package:gestion_locateur/setting/SettingView.dart';
import 'package:get/get.dart';

class Bottombarview extends StatelessWidget {
  Bottombarview({super.key});

  final List<Widget> screens = [Maisonview(), Settingview()];

  final Bottomcontroller controller = Get.put(Bottomcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Bottomcontroller>(builder: (controller) {
        return screens[controller.index];
      }),
      bottomNavigationBar: GetBuilder<Bottomcontroller>(builder: (controller) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "1".tr),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "2".tr)
          ],
          currentIndex: controller.index,
          onTap: (i) {
            controller.changeIndex(i);
          },
        );
      }),
    );
  }
}
