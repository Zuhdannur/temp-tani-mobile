import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/detail_anggaran_controller.dart';
import 'package:hitungtani/controllers/item_anggaran_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:loading_overlay/loading_overlay.dart';

class DetailAnggaranFormPage extends StatelessWidget {
  DetailAnggaranFormPage({Key? key}) : super(key: key);

  ItemAnggaranController controller = Get.put(ItemAnggaranController());

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
            "${controller.itemAnggaran.value.value?.id!=null?"Ubah":"Tambah"} Detail Anggaran",
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
                      if(controller.itemAnggaran.value.value?.id!=null){
                        controller.fetchItemAnggaran(id: controller.itemAnggaran.value.value?.id??0);
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
                                    controller: controller.itemAnggaran.value.value?.namaSubKategoriController??TextEditingController(),
                                    fieldName: "Nama Anggaran",
                                    textCapitalization: TextCapitalization.sentences,
                                    onChanged: (value){
                                      controller.itemAnggaran.value.value?.namaSubKategori = controller.itemAnggaran.value.value?.namaSubKategoriController.text;
                                    },
                                  ),
                                  SizedBox(height: 16,),
                                  AppTextFormField(
                                    label: "Keterangan Anggaran",
                                    controller: controller.itemAnggaran.value.value?.deskripsiController??TextEditingController(),
                                    fieldName: "Keterangan",
                                    keyboardType: TextInputType.multiline,
                                    textCapitalization: TextCapitalization.sentences,
                                    maxLines: 3,
                                    maxLength: 500,
                                    onChanged: (value){
                                      controller.itemAnggaran.value.value?.deskripsi = controller.itemAnggaran.value.value?.deskripsiController.text;
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
              if(controller.itemAnggaran.value.value?.id!=null){
                controller.updateItemAnggaran();
              }else{
                controller.createItemAnggaran();
              }
            },
            label: "Simpan",
          );
        }),
      ),
    );
  }
}
