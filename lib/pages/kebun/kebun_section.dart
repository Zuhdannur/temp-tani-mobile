import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/kebun_controller.dart';
// import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/helpers.dart';

class KebunSection extends StatelessWidget {
  KebunSection({Key? key}) : super(key: key);

  KebunController controller = Get.put(KebunController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight - 20,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextFormField(
                      label: "Nama Kebun",
                      controller: controller.kebun.value.value?.namaKebunController??TextEditingController(),
                      fieldName: "Nama Kebun",
                      textCapitalization: TextCapitalization.words,
                      onChanged: (value){
                        controller.kebun.value.value?.namaKebun = controller.kebun.value.value?.namaKebunController.text;
                      },
                    ),
                    SizedBox(height: 16,),
                    AppTextFormField(
                      label: "Alamat Kebun",
                      controller: controller.kebun.value.value?.alamatController??TextEditingController(),
                      fieldName: "Alamat Kebun",
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value){
                        controller.kebun.value.value?.alamat = controller.kebun.value.value?.alamatController.text;
                      },
                      maxLines: 3,
                      maxLength: 500,
                      // trailing: Material(
                      //   color: Colors.transparent,
                      //   borderRadius: BorderRadius.circular(100),
                      //   child: IconButton(
                      //     icon: Icon(Icons.location_pin, color: AppColors.icon, size: 16),
                      //     onPressed: () {
                      //       controller.pickLocation();
                      //     },
                      //   ),
                      // ),
                    ),
                    // SizedBox(height: 16,),
                    // Expanded(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       border: Border.all(color: AppColors.border)
                    //     ),
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(8),
                    //       child: Stack(
                    //         children: [
                    //           Obx(() {
                    //             return GoogleMap(
                    //               // padding: EdgeInsets.only(bottom: 30, left: 8, right: 8),
                    //               key: Key('maps${controller.gogleMapsKey.value}'),
                    //               padding: EdgeInsets.only(top: 40),
                    //               mapType: MapType.normal,
                    //               myLocationButtonEnabled: false,
                    //               myLocationEnabled: true,
                    //               mapToolbarEnabled: false,
                    //               zoomControlsEnabled: false,
                    //               initialCameraPosition: controller.indonesia,
                    //               // markers: [presensiController.marker.value].toSet(),
                    //               onMapCreated: (GoogleMapController con) async {
                    //                 controller.mapsController = Completer();
                    //                 controller.mapsController.complete(con);
                    //                 // await Future.delayed(Duration(milliseconds: 500));
                    //                 // if(controller.myLocation.value.value!=null&&controller.satkerSetting.value.value!=null){
                    //                 //   controller.navigateTo(currentLocation: controller.myLocation.value.value!);
                    //                 // }
                    //               },
                    //             );
                    //           }),
                    //           Positioned(
                    //             bottom: 16,
                    //             right: 16,
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   borderRadius: BorderRadius.circular(8),
                    //                   boxShadow: [
                    //                     BoxShadow(
                    //                         color: Color.fromRGBO(22, 22, 22, 0.1),
                    //                         offset: Offset(0, 0),
                    //                         blurRadius: 2
                    //                     ),
                    //                     BoxShadow(
                    //                         color: Color.fromRGBO(22, 22, 22, 0.1),
                    //                         offset: Offset(0, 2),
                    //                         blurRadius: 10
                    //                     )
                    //                   ]
                    //               ),
                    //               child: Material(
                    //                 color: Colors.transparent,
                    //                 child: InkWell(
                    //                   borderRadius: BorderRadius.circular(8),
                    //                   onTap: (){
                    //
                    //                   },
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(8.0),
                    //                     child: Icon(
                    //                       Icons.gps_fixed,
                    //                       color: AppColors.primary,
                    //                       size: 24,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: AppHelpers.cardBoxShadow
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: AppButtonPrimary(
                  label: "Selanjutnya",
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      controller.nextStep();
                    }
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
