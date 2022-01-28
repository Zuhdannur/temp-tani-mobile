import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/models/anggaran.dart';
import 'package:hitungtani/models/kebun.dart';
import 'package:hitungtani/models/summary.dart';
import 'package:hitungtani/services/repository.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class BerandaController extends GetxController {
  var kebun = Rxn<Kebun>().obs;
  var listKebun = List<Kebun>.empty(growable: true).obs;
  var listAnggaran = List<Anggaran>.empty(growable: true).obs;
  var summary = Rxn<Summary>().obs;

  var isLoading = false.obs;
  var oneIsLoading = false.obs;

  var idKebun = Rxn<int>().obs;
  var idAnggaran = Rxn<int>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    repository = locator<Repository>();
    fetchKebun();
    super.onInit();
  }

  void fetchKebun() async {
    isLoading.value = true;
    listKebun.value = await Kebun.instance.fetchAll()??[];
    isLoading.value = false;
  }

  void fetchOneKebun() async {
    oneIsLoading.value= true;
    kebun.value.value = null;
    kebun.value.value = await Kebun.instance.fetchOne(id: idKebun.value.value??0);
    oneIsLoading.value= false;
  }

  void fetchAnggaran() async {
    isLoading.value = true;
    listAnggaran.value = [];
    listAnggaran.value = await Anggaran.instance.fetchAll(id: idKebun.value.value??0)??[];
    isLoading.value = false;
  }

  void fetchSummary() async {
    isLoading.value = true;
    summary.value.value = null;
    summary.value.value = await Summary.instance.fetch(id: idAnggaran.value.value??0);
    isLoading.value = false;
  }

  var downloadProgress = Rxn<double>().obs;
  CancelToken cancelToken = CancelToken();

  late Repository repository;

  void cetakLaporan() async {
    downloadProgress.value.value = 0.0;
    cancelToken = CancelToken();
    String localPath = "${(await getApplicationDocumentsDirectory()).path}${Platform.pathSeparator}Hitung-Tani";
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return AlertDialog(
                  contentPadding: EdgeInsets.only(left: 24, bottom: 32, right: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  titlePadding: EdgeInsets.only(left: 24, top: 32, right: 24),
                  title: Column(
                    children: [
                      Icon(
                        Icons.download,
                        color: AppColors.primary,
                        size: 32,
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "Mengunduh...",
                        style: AppDmSans.heading4.copyWith(color: AppColors.monochromeColorSwatch[700]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8,),
                      Text(
                        "Silakan tunggu beberapa saat.",
                        style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12,),
                      Obx((){
                        return LinearProgressIndicator(
                          value: downloadProgress.value.value,
                          backgroundColor: AppColors.primaryColorSwatch[100],
                        );
                      }),
                      SizedBox(height: 24,),
                      AppButtonPrimary(
                          label: "Batalkan",
                          // enabled: sistemKerjaValue.value.value!=null,
                          onTap: () async {
                            cancelToken.cancel();
                            // Get.back();
                          }
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }
    );
    String file = localPath+Platform.pathSeparator+"Summary_${listAnggaran.firstWhere((element) => element.id==idAnggaran.value.value)}_${listKebun.firstWhere((element) => element.id==idKebun.value.value)}.pdf";
    var response = await repository.printSummary(file: file, cancelToken: cancelToken, id: idAnggaran.value.value??0);
    Get.back();
    if(response is ResponseBody && response.statusCode == 200){
      showResultDialog(title: "Rekap Presensi Berhasil Diunduh", message: "Silakan tekan tombol dibawah ini untuk membuka file.", buttonText: "Buka File", callback: (){
        OpenFile.open(file);
      }, type: "success");
    }
  }
}