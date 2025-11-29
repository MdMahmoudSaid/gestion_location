import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gestion_locateur/Url.dart';

class ApiService {
  final String baseUrl = Url().url;

  // Headers par défaut
  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
  };

  // ========== AUTHENTICATION ==========

  /// Connexion utilisateur
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/auth/login"),
        headers: _defaultHeaders,
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        print("STATUS LOGIN = ${response.statusCode}");
        print("RAW BODY LOGIN = ${response.body}");
        print("TYPE DECODE = ${jsonDecode(response.body).runtimeType}");

        return jsonDecode(response.body);
      } else {
        throw Exception(
            "Erreur d'authentification: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Erreur de connexion: $e");
    }
  }

  /// Enregistrement utilisateur
  Future<Map<String, dynamic>> register(
      String email, String password, String tel) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/auth/register"),
        headers: _defaultHeaders,
        body: jsonEncode({
          "email": email,
          "password": password,
          "tel": tel,
        }),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "Erreur d'enregistrement: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Erreur d'enregistrement: $e");
    }
  }

  // ========== MAISONS ==========

  /// Récupérer toutes les maisons
  Future<List<dynamic>> getAllMaisons() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/auth/maison/All"),
        headers: _defaultHeaders,
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Erreur lors de la récupération des maisons");
      }
    } catch (e) {
      throw Exception("Erreur: $e");
    }
  }

  /// Récupérer les maisons d'un utilisateur
  Future<List<dynamic>> getUserMaisons(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/auth/maison/Affiche/$userId"),
        headers: _defaultHeaders,
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Erreur lors de la récupération des maisons");
      }
    } catch (e) {
      throw Exception("Erreur: $e");
    }
  }

  /// Récupérer les détails d'une maison
  Future<Map<String, dynamic>> getMaisonDetails(int masonId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/auth/maison/find/$masonId"),
        headers: _defaultHeaders,
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Erreur lors de la récupération des détails");
      }
    } catch (e) {
      throw Exception("Erreur: $e");
    }
  }

  /// Ajouter une nouvelle maison avec images
  Future<Map<String, dynamic>> addMaison(
    int userId,
    String localisation,
    String prix,
    String description,
    double altitude,
    double longitude,
    List<String> imagePaths,
  ) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/auth/maison/ajout/$userId"),
      );

      // Ajouter les champs
      request.fields['localisation'] = localisation;
      request.fields['prix'] = prix;
      request.fields['description'] = description;
      request.fields['altitude'] = altitude.toString();
      request.fields['longitude'] = longitude.toString();

      // Ajouter les images
      for (String imagePath in imagePaths) {
        request.files.add(
          await http.MultipartFile.fromPath('images', imagePath),
        );
      }

      var response =
          await request.send().timeout(Duration(seconds: 30));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        throw Exception("Erreur lors de l'ajout: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erreur: $e");
    }
  }

  /// Modifier une maison
  Future<Map<String, dynamic>> updateMaison(
    int masonId,
    String localisation,
    String prix,
    String description,
    double altitude,
    double longitude,
    List<String>? imagePaths,
  ) async {
    try {
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse("$baseUrl/api/auth/maison/modifier/$masonId"),
      );

      // Ajouter les champs
      request.fields['localisation'] = localisation;
      request.fields['prix'] = prix;
      request.fields['description'] = description;
      request.fields['altitude'] = altitude.toString();
      request.fields['longitude'] = longitude.toString();

      // Ajouter les images si fournies
      if (imagePaths != null && imagePaths.isNotEmpty) {
        for (String imagePath in imagePaths) {
          request.files.add(
            await http.MultipartFile.fromPath('images', imagePath),
          );
        }
      }

      var response =
          await request.send().timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        throw Exception("Erreur lors de la modification: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erreur: $e");
    }
  }

  /// Supprimer une maison
  Future<void> deleteMaison(int masonId) async {
    try {
      final response = await http.delete(
        Uri.parse("$baseUrl/api/auth/maison/delete/$masonId"),
        headers: _defaultHeaders,
      ).timeout(Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception("Erreur lors de la suppression");
      }
    } catch (e) {
      throw Exception("Erreur: $e");
    }
  }
}
