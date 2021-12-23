import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class KebunController extends GetxController {
  var currentStep = 0.obs;
  var offset = 0.0.obs;

  var address = Rxn<String>().obs;

  var locationLoading = false.obs;
  var submitLoading = false.obs;

  CameraPosition indonesia = CameraPosition(
    target: LatLng(-6.2241875,106.8054558),
    zoom: 15,
  );

  Completer<GoogleMapController> mapsController = Completer();

  // late var circles = Set<Circle>().obs;
  // late var marker = Marker(markerId: MarkerId("satker"),).obs;
  late var myLocation = Rxn<Position>().obs;

  var gogleMapsKey = 0.obs;

  void nextStep() {
    offset.value = 1.0;
    currentStep.value++;
  }

  void prevStep() {
    offset.value = -1.0;
    currentStep.value--;
  }
}