import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/translate/TranslationContrller.dart';
import 'package:get/get.dart';

class Usersettings extends StatelessWidget {
  final List L;
  const Usersettings({super.key, required this.L});

  @override
  Widget build(BuildContext context) {
    Translationcontrller controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC49FFF),
        title: Text(
          "2".tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Card(
              color: Color(0xffFBFBFB),
              child: ListTile(
                leading: Icon(
                  Icons.person_pin,
                  size: 45,
                ),
                title: Text(
                  L[2].toString(),
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  L[1].toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.question,
                                animType: AnimType.rightSlide,
                                title: 'Tu est sur',
                                desc: "Tu veut déconnecte",
                                btnOkOnPress: () {
                                  Get.offAllNamed("/");
                                },
                                btnCancelOnPress: () {})
                            .show();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text("Logout"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
