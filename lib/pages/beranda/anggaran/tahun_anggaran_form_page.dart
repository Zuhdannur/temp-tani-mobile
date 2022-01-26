import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/controllers/tahun_anggaran_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';

class TahunAnggaranFormPage extends StatelessWidget {
  TahunAnggaranFormPage({Key? key}) : super(key: key);

  TahunAnggaranController controller = Get.put(TahunAnggaranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.monochromeColorSwatch[50],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        brightness: Brightness.dark,
        // toolbarHeight: 0,
        elevation: 0,
        title: Text(
          "Tambah Tahun Anggaran",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
        ),
        leading: BackButton(color: Colors.white,),
      ),
      body: SafeArea(
        child: Obx((){
            return LoadingOverlay(
              isLoading: controller.isLoading.value,
              child: RefreshIndicator(
                onRefresh: () async {
                  if(controller.tahun.value.value?.id!=null){
                    controller.fetchTahunAnggaran();
                  }
                },
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Obx((){
                                  return YearPicker(
                                    firstDate: DateTime(DateTime.now().year - 100, 1),
                                    lastDate: DateTime(DateTime.now().year + 100, 1),
                                    initialDate: DateTime.now(),
                                    selectedDate: controller.date.value,
                                    onChanged: (DateTime dateTime) {
                                      controller.date.value = dateTime;
                                      controller.tahun.value.value?.tahun = DateFormat("yyyy").format(dateTime);
                                    },
                                  );
                                }
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: AppHelpers.cardBoxShadow,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: MediaQuery.of(context).viewInsets.bottom+16),
        child: Obx((){
            return AppButtonPrimary(
              enabled: !controller.isLoading.value,
              onTap: (){
                if(controller.tahun.value.value?.id!=null){
                  controller.updateTahunAnggaran();
                }else{
                  controller.createTahunAnggaran();
                }
              },
              label: "Simpan",
            );
          }
        ),
      ),
    );
    return Container();
  }
}
