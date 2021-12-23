import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/pages/beranda/anggaran_tab.dart';
import 'package:hitungtani/pages/beranda/overview_tab.dart';
import 'package:hitungtani/pages/beranda/summary_tab.dart';
import 'package:hitungtani/pages/kebun/kebun_form_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class BerandaPage extends StatelessWidget {
  BerandaPage({Key? key}) : super(key: key);

  final BerandaController controller = Get.put(BerandaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        brightness: Brightness.dark,
        // toolbarHeight: 0,
        elevation: 0,
        title: Text(
          "Beranda",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(()=>KebunFormPage());
            },
            icon: Icon(FeatherIcons.plusSquare, color: Colors.white,)
          )
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: AppHelpers.cardBoxShadow,
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx((){
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              // border: Border.all(color: controller.kebun.value.value!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!, width: 1,),
                              color: AppColors.monochromeColorSwatch[50],
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                                        "Pilih Kebun"
                                    ),
                                  ],
                                ),
                              ),
                              value: controller.kebun.value.value,
                              icon: Icon(Icons.keyboard_arrow_down, color: controller.kebun.value.value!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!,),
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(),
                              onChanged: (String? newValue) {
                                controller.kebun.value.value = newValue;
                              },
                              alignment: AlignmentDirectional.topCenter,
                              style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                              items: controller.listKebun.map((e) {
                                return DropdownMenuItem<String>(
                                    value: e, child: Text(e, style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700]),)
                                );
                              }).toList(),
                              selectedItemBuilder: (context){
                                return controller.listKebun.map((e) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pilih Kebun",
                                        style: AppInter.overlineText.copyWith(color: AppColors.primary),
                                      ),
                                      Text(e, style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700])),
                                    ],
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ),
                      );
                    }),
                    TabBar(
                      isScrollable: true,
                      labelStyle: AppDmSans.subTitle.copyWith(color: AppColors.text),
                      unselectedLabelStyle: AppDmSans.subTitle.copyWith(color: AppColors.monochromeColorSwatch[50]),
                      unselectedLabelColor: AppColors.monochromeColorSwatch[300],
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.symmetric(horizontal: 16),
                      indicatorColor: AppColors.primary,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                      // indicator: ShapeDecoration(
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      //   color: AppColors.primary
                      // ),
                      tabs: [
                        Tab(text: "Overview Kebun",),
                        Tab(text: "Anggaran",),
                        Tab(text: "Summary",),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    OverviewTab(),
                    AnggaranTab(),
                    SummaryTab()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
