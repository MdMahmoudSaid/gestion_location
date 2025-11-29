import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_locateur/Url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Registercontroller extends GetxController {
  late bool l = false;
  register(BuildContext context, TextEditingController email,
      TextEditingController password, TextEditingController tel) async {
    Map<String, Object> body = {
      "email": email.text,
      "tel": tel.text,
      "password": password.text
    };
    print("test1");
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    var rep = await http.post(Uri.parse("${Url().url}/Api/auth/register"),
        body: jsonEncode(body), headers: headers);
    l = true;
    update();
    if (rep.statusCode != 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: "cette email a d'èja pris",
        btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success',
        desc: "Utilisateur crée avec success",
        btnOkOnPress: () {
          Get.offNamed("AuthenticationView");
        },
      ).show();
    }
  }
}
