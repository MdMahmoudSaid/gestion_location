import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/login/LoginController.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Loginview extends StatelessWidget {
  Loginview({super.key});
  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();
  final Logincontroller controller = Get.put(Logincontroller());
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 10.10,
      shadowColor: Colors.grey[850],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "21".tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                  color: Color(0xFFC49FFF)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "23".tr,
                        filled: true,
                        fillColor: Colors.white10,
                        hintText: "24".tr,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "25".tr,
                        filled: true,
                        fillColor: Colors.white10,
                        hintText: "26".tr,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                  onPressed: () {
                    if (email.text.isEmpty) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'Email est obligatoire',
                        btnOkOnPress: () {},
                      ).show();
                    } else if (pass.text.isEmpty) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'mot de pass est obligatoire',
                        btnOkOnPress: () {},
                      ).show();
                    } else {
                      controller.login(context, email, pass);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7D4FFE),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("21".tr)),
            )
          ],
        ),
      ),
    );
  }
}
