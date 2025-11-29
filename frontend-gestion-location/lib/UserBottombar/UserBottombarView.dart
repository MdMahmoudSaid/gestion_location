import 'package:flutter/material.dart';
import 'package:gestion_locateur/Ajoutmeson/AjouterView.dart';
import 'package:gestion_locateur/BottomNavigation/BottomController.dart';
import 'package:gestion_locateur/Usersettings/UserSettings.dart';
import 'package:gestion_locateur/usermaison/UsermaisonView.dart';
import 'package:get/get.dart';

class UserBottombarview extends StatelessWidget {
  UserBottombarview({super.key});

  final Bottomcontroller controller = Get.put(Bottomcontroller());

  @override
  Widget build(BuildContext context) {
    final List list = Get.arguments;
    final int id = list[0];
    final List<Widget> screens = [
      Usermaisonview(
        list: list,
      ),
      Ajouterview(
        id: id,
      ),
      Usersettings(
        L: list,
      )
    ];
    return Scaffold(
      body: GetBuilder<Bottomcontroller>(builder: (controller) {
        return screens[controller.index];
      }),
      bottomNavigationBar: GetBuilder<Bottomcontroller>(builder: (controller) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "1".tr),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "5".tr),
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
