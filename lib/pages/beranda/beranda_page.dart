import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/select_kebun.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/controllers/kebun_controller.dart';
import 'package:hitungtani/models/kebun.dart';
import 'package:hitungtani/pages/beranda/anggaran_tab.dart';
import 'package:hitungtani/pages/beranda/overview_tab.dart';
import 'package:hitungtani/pages/beranda/summary_tab.dart';
import 'package:hitungtani/pages/kebun/kebun_form_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
            onPressed: () async {
              await Get.to(()=>KebunFormPage());
              Get.delete<KebunController>();
              controller.fetchKebun();
              if(controller.idKebun.value.value!=null){
                controller.fetchOneKebun();
              }
            },
            icon: Icon(FeatherIcons.plusSquare, color: Colors.white,)
          )
        ],
      ),
      body: SafeArea(
        child: Obx((){
          return LoadingOverlay(
            isLoading: controller.isLoading.value||controller.oneIsLoading.value,
            child: Obx((){
              if(controller.listKebun.value.length==0){
                return RefreshIndicator(
                  backgroundColor: Colors.white,
                  onRefresh: () async {
                    controller.fetchKebun();
                  },
                  child: CustomScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        child: Container(
                          height: double.infinity,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/empty.png",
                                    width: 128,
                                  ),
                                  SizedBox(height: 12,),
                                  Text(
                                    "Kebun belum tersedia",
                                    style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    "Harap tambahkan data kebun.",
                                    style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                  ),
                                  SizedBox(height: 24,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: AppButtonPrimary(
                                        label: "Tambahkan Kebun",
                                        onTap: () async {
                                          await Get.to(()=>KebunFormPage());
                                          Get.delete<KebunController>();
                                          controller.fetchKebun();
                                          if(controller.idKebun.value.value!=null){
                                            controller.fetchOneKebun();
                                          }
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else return DefaultTabController(
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
                                    value: controller.idKebun.value.value,
                                    icon: Icon(Icons.keyboard_arrow_down, color: controller.kebun.value.value!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!,),
                                    iconSize: 24,
                                    elevation: 16,
                                    underline: Container(),
                                    onChanged: (int? newValue) {
                                      controller.idKebun.value.value = newValue;
                                      controller.idAnggaran.value.value = null;
                                      controller.fetchOneKebun();
                                      controller.fetchAnggaran();
                                    },
                                    alignment: AlignmentDirectional.topCenter,
                                    style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                                    items: controller.listKebun.map((e) {
                                      return DropdownMenuItem<int>(
                                          value: e.id, child: Text(e.namaKebun??"", style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700]),)
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
                                            Text(e.namaKebun??"", style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700])),
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
                            onTap: (int index){
                              if(controller.idKebun.value.value!=null){
                                if(index==1){
                                  controller.fetchAnggaran();
                                }else if(index==2){
                                  controller.fetchAnggaran();
                                  if(controller.idAnggaran.value.value!=null){
                                    controller.fetchSummary();
                                  }
                                }
                              }
                            },
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
                          if(controller.kebun.value.value==null)...[
                            SelectKebun(),
                            SelectKebun(),
                            SelectKebun(),
                          ]else...[
                            OverviewTab(),
                            AnggaranTab(),
                            SummaryTab()
                          ],
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
