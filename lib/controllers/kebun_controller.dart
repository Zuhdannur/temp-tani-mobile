import 'dart:async';

// import 'package:flutter_config/flutter_config.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:google_map_location_picker/google_map_location_picker.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/models/jenis_tanaman.dart';
import 'package:hitungtani/models/kebun.dart';
import 'package:hitungtani/pages/home_page.dart';
import 'package:hitungtani/utils/helpers.dart';

class KebunController extends GetxController {
  var currentStep = 0.obs;
  var offset = 0.0.obs;

  var address = Rxn<String>().obs;

  // var locationLoading = false.obs;
  var submitLoading = false.obs;

  // var apiKey = FlutterConfig.get("GOOGLE_MAPS_API_KEY");

  var kebun = Rxn<Kebun>().obs;

  var listJenis = List<JenisTanaman>.empty(growable: true).obs;
  var jenis = JenisTanaman().obs;
  var isLoading = false.obs;

  BerandaController berandaController = Get.put(BerandaController());

  // CameraPosition indonesia = CameraPosition(
  //   target: LatLng(-6.2241875,106.8054558),
  //   zoom: 15,
  // );
  //
  // Completer<GoogleMapController> mapsController = Completer();

  // late var circles = Set<Circle>().obs;
  // late var marker = Marker(markerId: MarkerId("satker"),).obs;
  // late var myLocation = Rxn<Position>().obs;

  // var gogleMapsKey = 0.obs;

  void nextStep() {
    offset.value = 1.0;
    currentStep.value++;
  }

  void prevStep() {
    offset.value = -1.0;
    currentStep.value--;
  }

  var idJenisTanaman = Rxn<int>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchJenis();
    if(Get.arguments==null){
      kebun.value.value = Kebun.instance;
    //   kebun.value = Get.arguments;
    //   idJenisTanaman.value.value = kebun.value.idJenistanaman;
    }
    super.onInit();
  }

  // void pickLocation() async {
  //   LocationResult? result = await showLocationPicker(Get.context!, "AIzaSyBFL6YRlTNKGrchwEzxCTauajZAc_VXBdY", countries: ["ID"]);
  // }

  Future fetchKebun() async {
    kebun.value.value = await Kebun.instance.fetchOne(id: Get.arguments);
    idJenisTanaman.value.value = kebun.value.value?.idJenistanaman;
  }

  void fetchJenis() async {
    isLoading.value = true;
    listJenis.value = await JenisTanaman.instance.fetchAll()??[];
    if(Get.arguments!=null){
      await fetchKebun();
    }
    isLoading.value = false;
  }

  void createKebun() async {
    isLoading.value = true;
    var result = await kebun.value.value?.create();
    isLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Kebun Berhasil");
        berandaController.fetchKebun();
        if(berandaController.kebun.value.value!=null){
          berandaController.fetchOneKebun();
        }
        Get.offAll(()=>HomePage());
      }
    }
  }

  void updateKebun() async {
    isLoading.value = true;
    var result = await kebun.value.value?.update();
    isLoading.value = false;
    if(result!=null){
      print(result.error);
      if(!(result.error??false)){
        AppHelpers.showSnackBar(
            snackBarMode: SnackBarMode.SUCCESS, content: "Simpan Kebun Berhasil");
        berandaController.fetchKebun();
        if(berandaController.kebun.value.value!=null){
          berandaController.fetchOneKebun();
        }
        Get.offAll(()=>HomePage());
      }
    }
  }
}