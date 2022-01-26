import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/pages/beranda/anggaran/anggaran_form_page.dart';
import 'package:hitungtani/pages/beranda/anggaran/detail_anggaran_page.dart';
import 'package:hitungtani/pages/beranda/anggaran/tahun_anggaran_form_page.dart';
import 'package:hitungtani/pages/beranda/anggaran/tahun_anggaran_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class AnggaranTab extends StatelessWidget {
  AnggaranTab({Key? key}) : super(key: key);

  BerandaController berandaController = Get.put(BerandaController());

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
                            onTap: () async {
                              await Get.to(()=>TahunAnggaranFormPage());
                              berandaController.fetchAnggaran();
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
                        if(berandaController.idKebun.value.value!=null){
                          berandaController.fetchAnggaran();
                        }
                      },
                      child: berandaController.listAnggaran.value.length==0?CustomScrollView(
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
                                        "Anggaran belum tersedia",
                                        style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                      ),
                                      SizedBox(height: 8,),
                                      Text(
                                        "Harap tambahkan data anggaran.",
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
                        itemCount: berandaController.listAnggaran.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          var tahun = berandaController.listAnggaran.value[index];
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
                                      await Get.to(()=>TahunAnggaranPage(), arguments: tahun.id);
                                      berandaController.fetchAnggaran();
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
                                                    "Tahun ${tahun.tahun}",
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
                                                      await Get.to(() => TahunAnggaranFormPage(), arguments: tahun.id);
                                                      berandaController.fetchAnggaran();
                                                    }else if(value==2){
                                                      showConfirmDialog(title: "Konfirmasi", content: "Anda yakin ingin menghapus data anggaran tahun ${tahun.tahun}?", callback: () async {
                                                        berandaController.isLoading.value = true;
                                                        final response = await tahun.delete();
                                                        berandaController.isLoading.value = false;
                                                        if(response?.error==false){
                                                          berandaController.fetchAnggaran();
                                                          AppHelpers.showSnackBar(
                                                              snackBarMode: SnackBarMode.SUCCESS, content: "Hapus Tahun Anggaran Berhasil");
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
                                                // Text(
                                                //   "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                                                //   style: AppDmSans.smallBody,
                                                // ),
                                                // SizedBox(height: 24,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total Biaya",
                                                      style: AppDmSans.smallBody,
                                                    ),
                                                    Text(
                                                      formatCurrency.format(tahun.totalBiayaKeseluruhan??0),
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
                                if(index!=berandaController.listAnggaran.value.length-1)...[
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
