import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/kebun_controller.dart';
import 'package:hitungtani/models/jenis_tanaman.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class JenisSection extends StatelessWidget {
  JenisSection({Key? key}) : super(key: key);

  KebunController controller = Get.put(KebunController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Obx((){
                                  return Container(
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: controller.kebun.value.value!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!, width: 1,),
                                        color: AppColors.monochromeColorSwatch[50],
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                      child: DropdownButton(
                                        isDense: false,
                                        isExpanded: true,
                                        borderRadius: BorderRadius.circular(8),
                                        hint: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "Pilih Jenis Tanam"
                                              ),
                                            ],
                                          ),
                                        ),
                                        value: controller.idJenisTanaman.value.value,
                                        icon: Icon(Icons.keyboard_arrow_down, color: controller.kebun.value.value?.idJenistanaman!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!,),
                                        iconSize: 24,
                                        elevation: 16,
                                        underline: Container(),
                                        onChanged: (int? newValue) {
                                          controller.idJenisTanaman.value.value = newValue;
                                          controller.kebun.value.value?.idJenistanaman = newValue;
                                        },
                                        alignment: AlignmentDirectional.topCenter,
                                        style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                                        items: controller.listJenis.map((e) {
                                          return DropdownMenuItem<int>(
                                              value: e.id, child: Text(e.namaJenistanaman??"", style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700]),)
                                          );
                                        }).toList(),
                                        selectedItemBuilder: (context){
                                          return controller.listJenis.map((e) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Pilih Jenis Tanam",
                                                  style: AppInter.overlineText.copyWith(color: AppColors.primary),
                                                ),
                                                Text(e.namaJenistanaman??"", style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700])),
                                              ],
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: AppTextFormField(
                                  label: "Luas Lahan",
                                  controller: controller.kebun.value.value?.luasLahanController??TextEditingController(),
                                  fieldName: "Luas Lahan",
                                  keyboardType: TextInputType.number,
                                  onChanged: (value){
                                    controller.kebun.value.value?.luasLahan = int.parse(controller.kebun.value.value?.luasLahanController.text??"0");
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextFormField(
                                  label: "Jarak Tanam",
                                  controller: controller.kebun.value.value?.jarakTanamController??TextEditingController(),
                                  fieldName: "Jarak Tanam",
                                  keyboardType: TextInputType.number,
                                  onChanged: (value){
                                    controller.kebun.value.value?.jarakTanam = int.parse(controller.kebun.value.value?.jarakTanamController.text??"0");
                                  },
                                ),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: AppTextFormField(
                                  label: "Waktu Penanaman",
                                  controller: controller.kebun.value.value?.waktuPenanamanController??TextEditingController(),
                                  fieldName: "Waktu Penanaman",
                                  keyboardType: TextInputType.number,
                                  onChanged: (value){
                                    controller.kebun.value.value?.waktuPenanaman = int.parse(controller.kebun.value.value?.waktuPenanamanController.text??"0");
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          AppTextFormField(
                            label: "Perkiraan Hasil Panen per Ubin",
                            controller: controller.kebun.value.value?.hasilPanenController??TextEditingController(),
                            fieldName: "Perkiraan Hasil Panen",
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              controller.kebun.value.value?.hasilPanenPerUbin = int.parse(controller.kebun.value.value?.hasilPanenController.text??"0");
                            },
                          ),
                          SizedBox(height: 16,),
                          AppTextFormField(
                            label: "Harga Satuan per Hasil Panen",
                            controller: controller.kebun.value.value?.hargaSatuanController??TextEditingController(),
                            fieldName: "Harga Satuan",
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              controller.kebun.value.value?.hargaSatuanPerHasilPanen = int.parse(controller.kebun.value.value?.hargaSatuanController.text??"0");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
                  label: "Simpan",
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      if(controller.kebun.value.value?.id!=null){
                        controller.updateKebun();
                      }else{
                        controller.createKebun();
                      }
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
