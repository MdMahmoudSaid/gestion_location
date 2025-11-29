import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gestion_locateur/services/ApiService.dart';
import 'package:gestion_locateur/usermaison/UsermaisonController.dart';
import 'package:gestion_locateur/usermaison/Usermaisondetaille/Maisondetaillecontroller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Updatecontroller extends GetxController {
  late ImagePicker picker = ImagePicker();
  late List<File> images = [];
  late double laltitude = 18.098564;
  late double longitude = -15.958748;
  static LatLng currentps = LatLng(37.77498, -122.4194);
  final ApiService apiService = ApiService();

  determinePosition(BuildContext context, controller) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'active la localisation',
        btnOkOnPress: () {},
      ).show();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    laltitude = position.latitude;
    longitude = position.longitude;

    currentps = LatLng(laltitude, longitude);
    _goToPosition(currentps, controller);
    update();
  }

  Future<void> _goToPosition(p, controller) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final GoogleMapController _controller = await controller.future;
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: p, zoom: 14.4746)));
  }

  new_position(LatLng position, controller) {
    laltitude = position.latitude;
    longitude = position.longitude;
    _goToPosition(position, controller);
    update();
  }

  pickeimage() async {
    List<XFile> image = await picker.pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (image.length != null && image.length < 6) {
      images = image.map((file) => File(file.path)).toList();
      update();
    } else {
      Get.snackbar("error", "vous pouver selectionner jusqu'a 5 photos");
    }
  }

  void remove(int index) {
    images.removeAt(index);
    update();
  }

  Future<void> sendData(BuildContext context, int id, TextEditingController loc,
      TextEditingController prix, TextEditingController desc) async {
    try {
      List<String>? imagePaths =
          images.isNotEmpty ? images.map((file) => file.path).toList() : null;

      await apiService.updateMaison(
        id,
        loc.text,
        prix.text,
        desc.text,
        laltitude,
        longitude,
        imagePaths,
      );

      final usermaisonController = Get.find<Usermaisoncontroller>();
      usermaisonController.update();
      update();

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Succès',
        desc: 'La maison a été modifiée avec succès',
        btnOkOnPress: () {
          Get.back();
          Get.find<Maisondetaillecontroller>().getbyid(id);
        },
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
