import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/controllers/item_anggaran_controller.dart';
import 'package:hitungtani/models/item_anggaran.dart';
import 'package:hitungtani/pages/beranda/anggaran/anggaran_form_page.dart';
import 'package:hitungtani/pages/beranda/anggaran/item_anggaran_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'detail_anggaran_form_page.dart';

class DetailAnggaranPage extends StatelessWidget {
  DetailAnggaranPage({Key? key}) : super(key: key);

  ItemAnggaranController controller = Get.put(ItemAnggaranController());

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
          "Detail Anggaran",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
        ),
        leading: BackButton(color: Colors.white,),
      ),
      body: SafeArea(
        child: Obx((){
          return LoadingOverlay(
            isLoading: controller.isLoading.value||controller.detailAnggaranLoading.value,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchDetailAnggaran();
                      controller.fetchAllItemAnggaran();
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: Padding(
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
                                        SizedBox(height: 16,),
                                        Obx((){
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    controller.detailAnggaran.value.value?.namaKategori??"-",
                                                    style: AppDmSans.title,
                                                  ),
                                                ),
                                                // PopupMenuButton(
                                                //   child: Container(
                                                //     decoration: BoxDecoration(
                                                //         color: AppColors.buttonSecondary.withOpacity(0.25),
                                                //         borderRadius: BorderRadius.circular(4)
                                                //
                                                //     ),
                                                //     child: Padding(
                                                //       padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                                //       child: Icon(
                                                //         FeatherIcons.moreHorizontal,
                                                //         color: AppColors.icon,
                                                //       ),
                                                //     ),
                                                //   ),
                                                //   itemBuilder: (context) => [
                                                //     // PopupMenuItem(
                                                //     //   value: 1,
                                                //     //   child: Text("Detail"),
                                                //     // ),
                                                //     PopupMenuItem(
                                                //       value: 1,
                                                //       child: Text("Edit"),
                                                //     ),
                                                //     PopupMenuItem(
                                                //       value: 2,
                                                //       child: Text("Delete"),
                                                //     )
                                                //   ],
                                                //   onSelected: (value) async {
                                                //     // if(value==1){
                                                //     //   Get.to(()=>DetailAnggaranPage());
                                                //     // }
                                                //   },
                                                // )
                                              ],
                                            ),
                                          );
                                        }),
                                        Obx((){
                                          return Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  controller.detailAnggaran.value.value?.deskripsi??"-",
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
                                                      formatCurrency.format(controller.detailAnggaran.value.value?.totalBiayaKategori??0),
                                                      style: AppDmSans.smallTitle,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                        Divider(
                                          height: 1,
                                          color: AppColors.border,
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Detail Anggaran",
                                                      style: AppDmSans.subTitle,
                                                    ),
                                                    SizedBox(height: 4,),
                                                    Text(
                                                      "Daftar detail anggaran operasional kebun.",
                                                      style: AppDmSans.overlineText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  borderRadius: BorderRadius.circular(4),
                                                  onTap: () async {
                                                    controller.itemAnggaran.value.value = ItemAnggaran.instance;
                                                    await Get.to(()=>DetailAnggaranFormPage());
                                                    controller.fetchDetailAnggaran();
                                                    controller.fetchAllItemAnggaran();
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
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Divider(
                                            height: 1,
                                            color: AppColors.border,
                                            thickness: 1,
                                          ),
                                        ),
                                        Expanded(
                                          child: Obx((){
                                            return RefreshIndicator(
                                              backgroundColor: Colors.white,
                                              onRefresh: () async {
                                                controller.fetchDetailAnggaran();
                                                controller.fetchAllItemAnggaran();
                                              },
                                              child: controller.listItemAnggaran.value.length==0?CustomScrollView(
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
                                                                "Detail Anggaran belum tersedia",
                                                                style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                                              ),
                                                              SizedBox(height: 8,),
                                                              Text(
                                                                "Harap tambahkan data detail anggaran.",
                                                                style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ):ListView.builder(
                                                itemCount: controller.listItemAnggaran.value.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  var itemAnggaran = controller.listItemAnggaran.value[index];
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
                                                            onTap: () async {
                                                              await Get.to(()=>ItemAnggaranPage(), arguments: itemAnggaran.id);
                                                              controller.fetchAllItemAnggaran();
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
                                                                            itemAnggaran.namaSubKategori??"-",
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
                                                                            if(value==1){
                                                                              controller.fetchItemAnggaran(id: itemAnggaran.id??0);
                                                                              await Get.to(() => DetailAnggaranFormPage(), arguments: itemAnggaran.id);
                                                                              controller.fetchAllItemAnggaran();
                                                                            }else if(value==2){
                                                                              showConfirmDialog(title: "Konfirmasi", content: "Anda yakin ingin menghapus data detail anggaran ${itemAnggaran.namaSubKategori}?", callback: () async {
                                                                                controller.isLoading.value = true;
                                                                                final response = await itemAnggaran.delete();
                                                                                controller.isLoading.value = false;
                                                                                if(response?.error==false){
                                                                                  controller.fetchAllItemAnggaran();
                                                                                  AppHelpers.showSnackBar(
                                                                                      snackBarMode: SnackBarMode.SUCCESS, content: "Hapus Detail Anggaran Berhasil");
                                                                                }
                                                                              });
                                                                            }
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
                                                                          itemAnggaran.deskripsi??"-",
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
                                                                              formatCurrency.format(itemAnggaran.totalBiayaSubKategori??0),
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
                                                        if(index!=controller.listItemAnggaran.length-1)...[
                                                          SizedBox(height: 8,)
                                                        ]else...[
                                                          SizedBox(height: 16,)
                                                        ]
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       backgroundColor: AppColors.primary,
  //       brightness: Brightness.dark,
  //       // toolbarHeight: 0,
  //       elevation: 0,
  //       title: Text(
  //         "Detail Anggaran",
  //         style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
  //       ),
  //       leading: BackButton(color: Colors.white,),
  //     ),
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           Expanded(
  //             child: CustomScrollView(
  //               slivers: [
  //                 SliverFillRemaining(
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(16),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.stretch,
  //                       children: [
  //                         Expanded(
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                                 color: Colors.white,
  //                                 borderRadius: BorderRadius.circular(8),
  //                                 boxShadow: AppHelpers.cardBoxShadow
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.stretch,
  //                               children: [
  //                                 SizedBox(height: 16,),
  //                                 Padding(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                         child: Text(
  //                                           "Biaya Pokok",
  //                                           style: AppDmSans.title,
  //                                         ),
  //                                       ),
  //                                       // PopupMenuButton(
  //                                       //   child: Container(
  //                                       //     decoration: BoxDecoration(
  //                                       //         color: AppColors.buttonSecondary.withOpacity(0.25),
  //                                       //         borderRadius: BorderRadius.circular(4)
  //                                       //
  //                                       //     ),
  //                                       //     child: Padding(
  //                                       //       padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
  //                                       //       child: Icon(
  //                                       //         FeatherIcons.moreHorizontal,
  //                                       //         color: AppColors.icon,
  //                                       //       ),
  //                                       //     ),
  //                                       //   ),
  //                                       //   itemBuilder: (context) => [
  //                                       //     // PopupMenuItem(
  //                                       //     //   value: 1,
  //                                       //     //   child: Text("Detail"),
  //                                       //     // ),
  //                                       //     PopupMenuItem(
  //                                       //       value: 1,
  //                                       //       child: Text("Edit"),
  //                                       //     ),
  //                                       //     PopupMenuItem(
  //                                       //       value: 2,
  //                                       //       child: Text("Delete"),
  //                                       //     )
  //                                       //   ],
  //                                       //   onSelected: (value) async {
  //                                       //     // if(value==1){
  //                                       //     //   Get.to(()=>DetailAnggaranPage());
  //                                       //     // }
  //                                       //   },
  //                                       // )
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.all(16),
  //                                   child: Column(
  //                                     crossAxisAlignment: CrossAxisAlignment.stretch,
  //                                     children: [
  //                                       Text(
  //                                         "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
  //                                         style: AppDmSans.smallBody,
  //                                       ),
  //                                       SizedBox(height: 24,),
  //                                       Row(
  //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                         children: [
  //                                           Text(
  //                                             "Total Biaya",
  //                                             style: AppDmSans.smallBody,
  //                                           ),
  //                                           Text(
  //                                             "Rp. 3.000.000",
  //                                             style: AppDmSans.smallTitle,
  //                                           ),
  //                                         ],
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Divider(
  //                                   height: 1,
  //                                   color: AppColors.border,
  //                                   thickness: 1,
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.all(16),
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                         child: Column(
  //                                           crossAxisAlignment: CrossAxisAlignment.start,
  //                                           children: [
  //                                             Text(
  //                                               "Detail Anggaran",
  //                                               style: AppDmSans.subTitle,
  //                                             ),
  //                                             SizedBox(height: 4,),
  //                                             Text(
  //                                               "Daftar detail anggaran operasional kebun.",
  //                                               style: AppDmSans.overlineText,
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       Material(
  //                                         color: Colors.transparent,
  //                                         child: InkWell(
  //                                           borderRadius: BorderRadius.circular(4),
  //                                           onTap: (){
  //                                             Get.to(()=>AnggaranFormPage());
  //                                           },
  //                                           child: Container(
  //                                             decoration: BoxDecoration(
  //                                                 color: AppColors.buttonSecondary.withOpacity(0.25),
  //                                                 borderRadius: BorderRadius.circular(4)
  //
  //                                             ),
  //                                             child: Padding(
  //                                               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //                                               child: Icon(
  //                                                 FeatherIcons.plus,
  //                                                 color: AppColors.icon,
  //                                                 size: 16,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                   child: Divider(
  //                                     height: 1,
  //                                     color: AppColors.border,
  //                                     thickness: 1,
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   child: RefreshIndicator(
  //                                     backgroundColor: Colors.white,
  //                                     onRefresh: () async {
  //
  //                                     },
  //                                     child: ListView.builder(
  //                                       itemCount: 4,
  //                                       itemBuilder: (BuildContext context, int index) {
  //                                         return Padding(
  //                                           padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                           child: Column(
  //                                             crossAxisAlignment: CrossAxisAlignment.stretch,
  //                                             children: [
  //                                               if(index==0)...[
  //                                                 SizedBox(height: 16,)
  //                                               ]else...[
  //                                                 SizedBox(height: 8,)
  //                                               ],
  //                                               Material(
  //                                                 color: Colors.transparent,
  //                                                 child: InkWell(
  //                                                   borderRadius: BorderRadius.circular(4),
  //                                                   onTap: (){
  //                                                     Get.to(()=>ItemAnggaranPage());
  //                                                   },
  //                                                   child: Container(
  //                                                     decoration: BoxDecoration(
  //                                                         border: Border.all(color: AppColors.border),
  //                                                         borderRadius: BorderRadius.circular(4)
  //                                                     ),
  //                                                     child: Column(
  //                                                       crossAxisAlignment: CrossAxisAlignment.stretch,
  //                                                       children: [
  //                                                         Padding(
  //                                                           padding: const EdgeInsets.all(16),
  //                                                           child: Row(
  //                                                             children: [
  //                                                               Expanded(
  //                                                                 child: Text(
  //                                                                   "Biaya Pokok",
  //                                                                   style: AppDmSans.smallTitle,
  //                                                                 ),
  //                                                               ),
  //                                                               PopupMenuButton(
  //                                                                 child: Container(
  //                                                                   decoration: BoxDecoration(
  //                                                                       color: AppColors.buttonSecondary.withOpacity(0.25),
  //                                                                       borderRadius: BorderRadius.circular(4)
  //
  //                                                                   ),
  //                                                                   child: Padding(
  //                                                                     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
  //                                                                     child: Icon(
  //                                                                       FeatherIcons.moreHorizontal,
  //                                                                       color: AppColors.icon,
  //                                                                     ),
  //                                                                   ),
  //                                                                 ),
  //                                                                 itemBuilder: (context) => [
  //                                                                   // PopupMenuItem(
  //                                                                   //   value: 1,
  //                                                                   //   child: Text("Detail"),
  //                                                                   // ),
  //                                                                   PopupMenuItem(
  //                                                                     value: 1,
  //                                                                     child: Text("Edit"),
  //                                                                   ),
  //                                                                   PopupMenuItem(
  //                                                                     value: 2,
  //                                                                     child: Text("Delete"),
  //                                                                   )
  //                                                                 ],
  //                                                                 onSelected: (value) async {
  //                                                                   // if(value==1){
  //                                                                   //   Get.to(()=>DetailAnggaranPage());
  //                                                                   // }
  //                                                                 },
  //                                                               )
  //                                                             ],
  //                                                           ),
  //                                                         ),
  //                                                         Divider(
  //                                                           height: 1,
  //                                                           color: AppColors.border,
  //                                                           thickness: 1,
  //                                                         ),
  //                                                         Padding(
  //                                                           padding: const EdgeInsets.all(16),
  //                                                           child: Column(
  //                                                             crossAxisAlignment: CrossAxisAlignment.stretch,
  //                                                             children: [
  //                                                               Text(
  //                                                                 "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
  //                                                                 style: AppDmSans.smallBody,
  //                                                               ),
  //                                                               SizedBox(height: 24,),
  //                                                               Row(
  //                                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                                                 children: [
  //                                                                   Text(
  //                                                                     "Total Biaya",
  //                                                                     style: AppDmSans.smallBody,
  //                                                                   ),
  //                                                                   Text(
  //                                                                     "Rp. 3.000.000",
  //                                                                     style: AppDmSans.smallTitle,
  //                                                                   ),
  //                                                                 ],
  //                                                               )
  //                                                             ],
  //                                                           ),
  //                                                         ),
  //                                                       ],
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               if(index!=3)...[
  //                                                 SizedBox(height: 8,)
  //                                               ]else...[
  //                                                 SizedBox(height: 16,)
  //                                               ]
  //                                             ],
  //                                           ),
  //                                         );
  //                                       },
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
