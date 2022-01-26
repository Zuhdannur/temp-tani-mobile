import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/barang_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ItemAnggaranFormPage extends StatelessWidget {
  ItemAnggaranFormPage({Key? key}) : super(key: key);

  BarangController controller = Get.put(BarangController());

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
            "${controller.barang.value.value?.id!=null?"Ubah":"Tambah"} Item Anggaran",
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
                      if(controller.barang.value.value?.id!=null){
                        controller.fetchBarang(id: controller.barang.value.value?.id??0);
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
                                    label: "Nama Barang",
                                    controller: controller.barang.value.value?.namaBarangController??TextEditingController(),
                                    fieldName: "Nama Barang",
                                    textCapitalization: TextCapitalization.sentences,
                                    onChanged: (value){
                                      controller.barang.value.value?.namaBarang = controller.barang.value.value?.namaBarangController.text;
                                    },
                                  ),
                                  SizedBox(height: 16,),
                                  AppTextFormField(
                                    label: "Keterangan Barang",
                                    controller: controller.barang.value.value?.deskripsiController??TextEditingController(),
                                    fieldName: "Keterangan",
                                    keyboardType: TextInputType.multiline,
                                    textCapitalization: TextCapitalization.sentences,
                                    maxLines: 3,
                                    maxLength: 500,
                                    onChanged: (value){
                                      controller.barang.value.value?.deskripsi = controller.barang.value.value?.deskripsiController.text;
                                    },
                                  ),
                                  SizedBox(height: 16,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppTextFormField(
                                          label: "Kuantitas",
                                          controller: controller.barang.value.value?.kuantitasController??TextEditingController(),
                                          fieldName: "Kuantitas",
                                          keyboardType: TextInputType.number,
                                          incrementControl: true,
                                          onChanged: (value){
                                            controller.barang.value.value?.kuantitas = int.parse(controller.barang.value.value?.kuantitasController.text??"0");
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 16,),
                                      Expanded(
                                        child: AppTextFormField(
                                          label: "Satuan",
                                          controller: controller.barang.value.value?.satuanController??TextEditingController(),
                                          fieldName: "Satuan",
                                          textCapitalization: TextCapitalization.sentences,
                                          onChanged: (value){
                                            controller.barang.value.value?.satuan = controller.barang.value.value?.satuanController.text;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16,),
                                  AppTextFormField(
                                    label: "Jumlah Biaya (Rp.)",
                                    controller: controller.barang.value.value?.jumlahBiayaController??TextEditingController(),
                                    fieldName: "Jumlah Biaya",
                                    keyboardType: TextInputType.number,
                                    onChanged: (value){
                                      controller.barang.value.value?.jumlahBiaya = int.parse(controller.barang.value.value?.jumlahBiayaController.text??"0");
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
              if(controller.barang.value.value?.id!=null){
                controller.updateBarang();
              }else{
                controller.createBarang();
              }
            },
            label: "Simpan",
          );
        }),
      ),
    );
  }
}
