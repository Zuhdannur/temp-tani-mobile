import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:hitungtani/pages/beranda/anggaran/anggaran_form_page.dart';
import 'package:hitungtani/pages/beranda/anggaran/detail_anggaran_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class AnggaranTab extends StatelessWidget {
  const AnggaranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: AppHelpers.cardBoxShadow
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Daftar Anggaran",
                                style: AppDmSans.subTitle,
                              ),
                              SizedBox(height: 4,),
                              Text(
                                "Daftar anggaran operasional kebun.",
                                style: AppDmSans.overlineText,
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            onTap: (){
                              Get.to(()=>AnggaranFormPage());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.buttonSecondary.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(4)

                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Icon(
                                  FeatherIcons.plus,
                                  color: AppColors.icon,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: AppColors.border,
                    thickness: 1,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      backgroundColor: Colors.white,
                      onRefresh: () async {

                      },
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if(index==0)...[
                                  SizedBox(height: 16,)
                                ]else...[
                                  SizedBox(height: 8,)
                                ],
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(4),
                                    onTap: (){
                                      Get.to(()=>DetailAnggaranPage());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: AppColors.border),
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Biaya Pokok",
                                                    style: AppDmSans.smallTitle,
                                                  ),
                                                ),
                                                PopupMenuButton(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors.buttonSecondary.withOpacity(0.25),
                                                        borderRadius: BorderRadius.circular(4)

                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                                      child: Icon(
                                                        FeatherIcons.moreHorizontal,
                                                        color: AppColors.icon,
                                                      ),
                                                    ),
                                                  ),
                                                  itemBuilder: (context) => [
                                                    // PopupMenuItem(
                                                    //   value: 1,
                                                    //   child: Text("Detail"),
                                                    // ),
                                                    PopupMenuItem(
                                                      value: 1,
                                                      child: Text("Edit"),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 2,
                                                      child: Text("Delete"),
                                                    )
                                                  ],
                                                  onSelected: (value) async {
                                                    // if(value==1){
                                                    //   Get.to(()=>DetailAnggaranPage());
                                                    // }
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                            color: AppColors.border,
                                            thickness: 1,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                                                  style: AppDmSans.smallBody,
                                                ),
                                                SizedBox(height: 24,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total Biaya",
                                                      style: AppDmSans.smallBody,
                                                    ),
                                                    Text(
                                                      "Rp. 3.000.000",
                                                      style: AppDmSans.smallTitle,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if(index!=3)...[
                                  SizedBox(height: 8,)
                                ]else...[
                                  SizedBox(height: 16,)
                                ]
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
