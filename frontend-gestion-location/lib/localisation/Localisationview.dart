import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class Localisationview extends StatelessWidget {
  const Localisationview({super.key});

  @override
  Widget build(BuildContext context) {
    late Map<String, dynamic> lo = Get.arguments;
    late double L = lo['L'];
    late double A = lo['A'];
    late Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(A, L), zoom: 14),
        markers: {
          Marker(
              markerId: MarkerId("1"),
              icon: BitmapDescriptor.defaultMarker,
              position: LatLng(A, L)),
        },
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
