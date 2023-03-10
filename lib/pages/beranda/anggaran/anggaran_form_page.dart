import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/detail_anggaran_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:loading_overlay/loading_overlay.dart';

class AnggaranFormPage extends StatelessWidget {
  AnggaranFormPage({Key? key}) : super(key: key);

  DetailAnggaranController controller = Get.put(DetailAnggaranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.monochromeColorSwatch[50],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        brightness: Brightness.dark,
        // toolbarHeight: 0,
        elevation: 0,
        title: Obx((){
          return Text(
            "${controller.detailAnggaran.value.value?.id!=null?"Ubah":"Tambah"} Anggaran",
            style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
          );
        }),
        leading: BackButton(color: Colors.white,),
      ),
      body: SafeArea(
        child: Obx((){
          return LoadingOverlay(
            isLoading: controller.formLoading.value,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      if(controller.detailAnggaran.value.value?.id!=null){
                        controller.fetchDetailAnggaran(id: controller.detailAnggaran.value.value?.id??0);
                      }
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AppTextFormField(
                                    label: "Nama Anggaran",
                                    controller: controller.detailAnggaran.value.value?.namaKategoriController??TextEditingController(),
                                    fieldName: "Nama Anggaran",
                                    textCapitalization: TextCapitalization.sentences,
                                    onChanged: (value){
                                      controller.detailAnggaran.value.value?.namaKategori = controller.detailAnggaran.value.value?.namaKategoriController.text;
                                    },
                                  ),
                                  SizedBox(height: 16,),
                                  AppTextFormField(
                                    label: "Keterangan Anggaran",
                                    controller: controller.detailAnggaran.value.value?.deskripsiController??TextEditingController(),
                                    fieldName: "Keterangan",
                                    keyboardType: TextInputType.multiline,
                                    textCapitalization: TextCapitalization.sentences,
                                    maxLines: 3,
                                    maxLength: 500,
                                    onChanged: (value){
                                      controller.detailAnggaran.value.value?.deskripsi = controller.detailAnggaran.value.value?.deskripsiController.text;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: AppHelpers.cardBoxShadow,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: MediaQuery.of(context).viewInsets.bottom+16),
        child: Obx((){
          return AppButtonPrimary(
            enabled: !controller.formLoading.value,
            onTap: (){
              if(controller.detailAnggaran.value.value?.id!=null){
                controller.updateDetailAnggaran();
              }else{
                controller.createDetailAnggaran();
              }
            },
            label: "Simpan",
          );
        }),
      ),
    );
  }
}
