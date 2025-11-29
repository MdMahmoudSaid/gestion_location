import 'package:gestion_locateur/services/ApiService.dart';
import 'package:get/get.dart';

class Usermaisoncontroller extends GetxController {
  List maison = [];
  bool t = false;
  final ApiService apiService = ApiService();

  get(int id) async {
    try {
      final result = await apiService.getUserMaisons(id);
      maison = result;
      t = true;
      update();
    } catch (e) {
      print("Erreur: $e");
      t = false;
      update();
    }
  }

  Future<void> delete(id) async {
    try {
      await apiService.deleteMaison(id);
      maison.removeWhere((m) => m['id'] == id);
      update();
    } catch (e) {
      print("Erreur: $e");
    }
  }
}
