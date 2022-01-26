import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_stepper.dart';
import 'package:hitungtani/controllers/kebun_controller.dart';
import 'package:hitungtani/pages/kebun/kebun_section.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'jenis_section.dart';

class KebunFormPage extends StatelessWidget {
  KebunFormPage({Key? key}) : super(key: key);

  KebunController controller = Get.put(KebunController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(controller.currentStep.value==0) {
          Get.back();
        }
        else {
          controller.prevStep();
          // if(presensiController.currentStep.value==0){
          //   var controller = await presensiController.mapsController.future;
          //   controller.setMapStyle("[]");
          // }
        };
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.monochromeColorSwatch[50],
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          brightness: Brightness.dark,
          // toolbarHeight: 0,
          elevation: 0,
          title: Text(
            "Tambah Kebun",
            style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
          ),
          leading: BackButton(color: Colors.white,),
        ),
        body: Obx((){
          return LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: RefreshIndicator(
              onRefresh: () async {
                controller.fetchJenis();
              },
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    child: Container(
                      height: double.infinity,
                      child: Obx((){
                        return AppStepper(
                          type: StepperType.horizontal,
                          onStepContinue: (){
                            controller.currentStep.value += 1;
                          },
                          steps: [
                            Step(
                              isActive: controller.currentStep.value>=0,
                              title: Text(
                                "Kebun",
                                style: AppInter.overlineText.copyWith(fontWeight: FontWeight.w600, color: controller.currentStep.value>=0?AppColors.monochromeColorSwatch[700]:AppColors.monochromeColorSwatch[300]),
                              ),
                              content: KebunSection(key: Key("kebunsection"),),
                            ),
                            Step(
                              isActive: controller.currentStep.value>=1,
                              title: Text(
                                "Jenis Tanam",
                                style: AppInter.overlineText.copyWith(fontWeight: FontWeight.w600, color: controller.currentStep.value>=1?AppColors.monochromeColorSwatch[700]:AppColors.monochromeColorSwatch[300]),
                              ),
                              content: JenisSection(key: Key("jenissection"),),
                            ),
                          ],
                          currentStep: controller.currentStep.value,
                          offset: controller.offset.value,
                        );
                      }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
