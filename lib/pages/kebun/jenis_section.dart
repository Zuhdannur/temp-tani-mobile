import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/kebun_controller.dart';
import 'package:hitungtani/utils/helpers.dart';

class JenisSection extends StatelessWidget {
  JenisSection({Key? key}) : super(key: key);

  KebunController controller = Get.put(KebunController());

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                label: "Jenis Tanaman",
                                controller: TextEditingController(),
                                fieldName: "Jenis Tanaman",
                                onChanged: (value){

                                },
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: AppTextFormField(
                                label: "Luas Lahan",
                                controller: TextEditingController(),
                                fieldName: "Luas Lahan",
                                onChanged: (value){

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
                                controller: TextEditingController(),
                                fieldName: "Jarak Tanam",
                                onChanged: (value){

                                },
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: AppTextFormField(
                                label: "Waktu Penanaman",
                                controller: TextEditingController(),
                                fieldName: "Waktu Penanaman",
                                onChanged: (value){

                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16,),
                        AppTextFormField(
                          label: "Perkiraan Hasil Panen per Ubin",
                          controller: TextEditingController(),
                          fieldName: "Perkiraan Hasil Panen",
                          onChanged: (value){

                          },
                        ),
                        SizedBox(height: 16,),
                        AppTextFormField(
                          label: "Harga Satuan per Hasil Panen",
                          controller: TextEditingController(),
                          fieldName: "Harga Satuan",
                          onChanged: (value){

                          },
                        ),
                      ],
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

                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
