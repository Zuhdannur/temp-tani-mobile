import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/controllers/barang_controller.dart';
import 'package:hitungtani/models/barang.dart';
import 'package:hitungtani/pages/beranda/anggaran/anggaran_form_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'item_anggaran_form_page.dart';

class ItemAnggaranPage extends StatelessWidget {
  ItemAnggaranPage({Key? key}) : super(key: key);

  BarangController controller = Get.put(BarangController());

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
          "Item Anggaran",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
        ),
        leading: BackButton(color: Colors.white,),
      ),
      body: SafeArea(
        child: Obx((){
          return LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchItemAnggaran();
                      controller.fetchAllBarang();
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
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  controller.itemAnggaran.value.value?.namaSubKategori??"-",
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                controller.itemAnggaran.value.value?.deskripsi??"-",
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
                                                    formatCurrency.format(controller.itemAnggaran.value.value?.totalBiayaSubKategori??0,),
                                                    style: AppDmSans.smallTitle,
                                                  ),
                                                ],
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
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Item Anggaran",
                                                      style: AppDmSans.subTitle,
                                                    ),
                                                    SizedBox(height: 4,),
                                                    Text(
                                                      "Daftar item anggaran operasional kebun.",
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
                                                    controller.barang.value.value = Barang.instance;
                                                    await Get.to(()=>ItemAnggaranFormPage());
                                                    controller.fetchItemAnggaran();
                                                    controller.fetchAllBarang();
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
                                                controller.fetchItemAnggaran();
                                                controller.fetchAllBarang();
                                              },
                                              child: controller.listBarang.value.length==0?CustomScrollView(
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
                                                                "Item Anggaran belum tersedia",
                                                                style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                                              ),
                                                              SizedBox(height: 8,),
                                                              Text(
                                                                "Harap tambahkan data item anggaran.",
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
                                                itemCount: controller.listBarang.value.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  var barang = controller.listBarang.value[index];
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
                                                        Container(
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
                                                                        "${barang.kuantitas} ${barang.satuan} ${barang.namaBarang}",
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
                                                                          controller.fetchBarang(id: barang.id??0);
                                                                          await Get.to(() => ItemAnggaranFormPage(), arguments: barang.id);
                                                                          controller.fetchAllBarang();
                                                                        }else if(value==2){
                                                                          showConfirmDialog(title: "Konfirmasi", content: "Anda yakin ingin menghapus data item anggaran ${barang.namaBarang}?", callback: () async {
                                                                            controller.isLoading.value = true;
                                                                            final response = await barang.delete();
                                                                            controller.isLoading.value = false;
                                                                            if(response?.error==false){
                                                                              controller.fetchAllBarang();
                                                                              AppHelpers.showSnackBar(
                                                                                  snackBarMode: SnackBarMode.SUCCESS, content: "Hapus Item Anggaran Berhasil");
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
                                                                      barang.deskripsi??"-",
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
                                                                          formatCurrency.format(barang.jumlahBiaya??0),
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
                                                        if(index!=controller.listBarang.value.length-1)...[
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
                                          }),
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
}
