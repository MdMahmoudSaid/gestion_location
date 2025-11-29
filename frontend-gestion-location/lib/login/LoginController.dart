import 'package:flutter/material.dart';
import 'package:gestion_locateur/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Logincontroller extends GetxController {
  late int id;
  late String tel;
  late String _email;
  final ApiService apiService = ApiService();

  login(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    try {
      final result = await apiService.login(email.text, password.text);
      
      id = result['user_id'] ?? result['id'] ?? 0;
      tel = result['tel'] ?? '';
      _email = result['email'] ?? '';
      
      List info = [id, tel, _email];
      Get.offAllNamed("/user/bottombar", arguments: info);
      
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Succès',
        desc: "Connecté avec succès",
        btnOkOnPress: () {},
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Erreur',
        desc: e.toString().replaceAll('Exception: ', ''),
        btnOkOnPress: () {},
      ).show();
    }
  }
}
