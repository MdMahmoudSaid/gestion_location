import 'package:gestion_locateur/services/ApiService.dart';
import 'package:get/get.dart';

class Maisoncontroller extends GetxController {
  List maison = [];
  bool t = false;
  String? selectlocalisation;
  List filtermaison = [];
  final ApiService apiService = ApiService();

  Future<void> All() async {
    try {
      final result = await apiService.getAllMaisons();
      maison = result;
      filtermaison = maison;
      t = true;
      update();
    } catch (e) {
      print("Erreur: $e");
      t = false;
      update();
    }
  }

  filter(String l) {
    selectlocalisation = l;
    filtermaison = maison
        .where((m) => m['localisation']
            .toString()
            .toLowerCase()
            .contains(l.toLowerCase()))
        .toList();
    update();
  }

  list() {
    selectlocalisation = null;
    filtermaison = maison;
    update();
  }
}
