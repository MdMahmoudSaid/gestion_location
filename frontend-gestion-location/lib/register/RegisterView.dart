import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/register/RegisterController.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Registerview extends StatelessWidget {
  Registerview({super.key});

  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();
  late TextEditingController tel = TextEditingController();
  late TextEditingController cpass = TextEditingController();

  final Registercontroller controller = Get.put(Registercontroller());

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 10.10,
      shadowColor: Colors.grey[850],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "22".tr,
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
                        filled: true,
                        fillColor: Colors.white10,
                        labelText: "23".tr,
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
                    controller: tel,
                    maxLength: 8,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white10,
                        hintText: "28".tr,
                        labelText: "27".tr,
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
                  TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white10,
                        labelText: "25".tr,
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: cpass,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white10,
                        labelText: "29".tr,
                        hintText: "30".tr,
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
                        desc: 'Mot de pass est obligatoire',
                        btnOkOnPress: () {},
                      ).show();
                    } else if (cpass.text != pass.text) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'error comfirm mot de pass',
                        btnOkOnPress: () {},
                      ).show();
                    } else if (tel.text.isEmpty) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'Numero de telephone est obligatoire',
                        btnOkOnPress: () {},
                      ).show();
                    } else {
                      controller.register(context, email, pass, tel);
                      email.text = "";
                      tel.text = "";
                      pass.text = "";
                      cpass.text = "";
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7D4FFE),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("31".tr)),
            )
          ],
        ),
      ),
    );
  }
}
