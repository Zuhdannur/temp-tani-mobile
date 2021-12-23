import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_button_secondary.dart';

import 'colors.dart';
import 'font_styles.dart';

enum SnackBarMode {
  ERROR,
  SUCCESS
}

class AppHelpers{
  static List<BoxShadow> cardBoxShadow = [
    BoxShadow(
        color: Color.fromRGBO(22, 22, 22, 0.1),
        offset: Offset(0, 0),
        blurRadius: 2
    ),
    BoxShadow(
        color: Color.fromRGBO(22, 22, 22, 0.1),
        offset: Offset(0, 2),
        blurRadius: 10
    )
  ];

  static List<BoxShadow> cardBoxShadow2 = [
    BoxShadow(
        color: Color.fromRGBO(22, 22, 22, 0.05),
        offset: Offset(0, 1),
        blurRadius: 1
    ),
    BoxShadow(
        color: Color.fromRGBO(22, 22, 22, 0.25),
        offset: Offset(0, 0),
        blurRadius: 1
    )
  ];

  static showSnackBar({
    required SnackBarMode snackBarMode,
    required String content,
  }) {
    print("aksdja");
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(
        content,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 16/10,
          color: snackBarMode == SnackBarMode.SUCCESS ? AppColors.semanticColorSwatch[500] : AppColors.danger500
        ),
      ),
      duration: Duration(milliseconds: 6000),
      backgroundColor: snackBarMode == SnackBarMode.SUCCESS ? AppColors.semanticColorSwatch[100] : AppColors.danger100,
      behavior: SnackBarBehavior.floating,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: AppColors.danger500),
      ),
      action: SnackBarAction(
        label: 'Tutup',
        textColor: AppColors.danger500,
        onPressed: () {
          ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
        },
      )
    ));
  }
}

final formatCurrency = NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);
final formatPercentage = NumberFormat.percentPattern();

void onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    callback();
  });
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await Hive.openBox("auth");
    // await Future.delayed(Duration(seconds: 3));
  }
}

Future<String> getAddressFromLatLong({required double lat, required double long}) async {
  List<Placemark> myPlacemarks = await placemarkFromCoordinates(lat, long, localeIdentifier: "id_ID");
  print(myPlacemarks[0].toJson());
  return "${myPlacemarks[0].street}, ${myPlacemarks[0].subLocality}, ${myPlacemarks[0].locality}, ${myPlacemarks[0].subAdministrativeArea}, ${myPlacemarks[0].administrativeArea} ${myPlacemarks[0].postalCode}";
}

void showResultDialog({String? title, String? message, String? type, String? buttonText, Function? callback}){
  showDialog(
      context: Get.context!,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.only(left: 24, bottom: 32, right: 24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              titlePadding: EdgeInsets.only(left: 24, top: 32, right: 24),
              title: Column(
                children: [
                  if(type=="success")...[
                    Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.semanticColorSwatch[500],
                      size: 64,
                    ),
                  ]else if(type=="warning")...[
                    Icon(
                      Icons.info,
                      color: AppColors.warningColorSwatch[500],
                      size: 64,
                    ),
                  ]else...[
                    Icon(
                      Icons.cancel_rounded,
                      color: AppColors.dangerColorSwatch[500],
                      size: 64,
                    ),
                  ],
                  SizedBox(height: 6,),
                  Text(
                    title??"",
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
                    message??"",
                    style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24,),
                  AppButtonPrimary(
                      label: buttonText??"Tutup",
                      // enabled: sistemKerjaValue.value.value!=null,
                      onTap: () async {
                        Get.back();
                        if(callback!=null) callback();
                      }
                  )
                ],
              ),
            );
          },
        );
      }
  );
}

showConfirmDialog({String? title, String? content, Function? callback}){
  showDialog<void>(
    context: Get.context!,
    barrierDismissible: true,
    builder: (BuildContext context){
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 24, bottom: 12, right: 24),
        actionsPadding: EdgeInsets.only(left: 24, bottom: 24, right: 24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        title: Text(title??"", style: AppDmSans.heading4.copyWith(color: AppColors.monochromeColorSwatch[700]), textAlign: TextAlign.center,),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(content??"", style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]), textAlign: TextAlign.center,),
          ],
        ),
        actions: <Widget>[
          AppButtonSecondary(
              label: "Tidak",
              onTap: () async {
                Get.back();
              }
          ),
          SizedBox(height: 6,),
          AppButtonPrimary(
              label: "Ya",
              onTap: () async {
                if(callback!=null) callback();
                Get.back();
              }
          )
        ],
      );
    },
  );
}
