import 'dart:async';
import 'dart:io';
import 'package:gestion_locateur/services/ApiService.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Ajoutcontroller extends GetxController {
  late double laltitude = 18.098564;
  late double longitude = -15.958748;
  static LatLng currentps = LatLng(37.77498, -122.4194);
  final ImagePicker _picker = ImagePicker();
  List<File> images = [];
  final ApiService apiService = ApiService();

  // ignore: unused_element
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

  Future<void> pickImages() async {
    final List<XFile>? f = await _picker.pickMultiImage();
    if (f != null && f.length <= 5) {
      images = f.map((file) => File(file.path)).toList();
      update();
    } else {
      Get.snackbar("error", "vous pouver selectionner jusqu'a 5 photos");
    }
  }

  void remove(int index) {
    images.removeAt(index);
    update();
  }

  sendData(BuildContext context, int id, TextEditingController loc,
      TextEditingController prix, TextEditingController desc) async {
    try {
      List<String> imagePaths = images.map((file) => file.path).toList();
      
      await apiService.addMaison(
        id,
        loc.text,
        prix.text,
        desc.text,
        laltitude,
        longitude,
        imagePaths,
      );

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Succès',
        desc: 'La maison a été ajoutée avec succès',
        btnOkOnPress: () {
          images.clear();
          loc.clear();
          prix.clear();
          desc.clear();
          update();
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
