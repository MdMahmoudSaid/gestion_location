import 'package:gestion_locateur/services/ApiService.dart';
import 'package:get/get.dart';

class Maisondetaillecontroller extends GetxController {
  late Map<String, dynamic> m = {};
  late List image = [];
  final ApiService apiService = ApiService();

  Future<void> getbyid(int id) async {
    try {
      final result = await apiService.getMaisonDetails(id);
      m = result;
      image = m['images'] ?? [];
      update();
    } catch (e) {
      print("Erreur: $e");
    }
  }
}
