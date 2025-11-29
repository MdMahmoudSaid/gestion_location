import 'package:flutter/material.dart';
import 'package:gestion_locateur/translate/TranslationContrller.dart';
import 'package:get/get.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key});

  @override
  Widget build(BuildContext context) {
    Translationcontrller controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC49FFF),
        title: Text(
          "2".tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.changelangue("fr");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7D4FFE),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("Français")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.changelangue("ar");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7D4FFE),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("العربية")),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/AuthenticationView");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC49FFF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("32".tr))
          ],
        ),
      ),
    );
  }
}
