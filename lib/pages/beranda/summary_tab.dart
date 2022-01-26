import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hitungtani/components/select_kebun.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class SummaryTab extends StatelessWidget {
  SummaryTab({Key? key}) : super(key: key);

  BerandaController controller = Get.put(BerandaController());

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
                                "Summary",
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
                        // Material(
                        //   color: Colors.transparent,
                        //   child: InkWell(
                        //     borderRadius: BorderRadius.circular(4),
                        //     onTap: (){
                        //
                        //     },
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: AppColors.buttonSecondary.withOpacity(0.25),
                        //           borderRadius: BorderRadius.circular(4)
                        //
                        //       ),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        //         child: Icon(
                        //           FeatherIcons.printer,
                        //           color: AppColors.icon,
                        //           size: 16,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: AppColors.border,
                    thickness: 1,
                  ),
                  Obx((){
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(color: controller.kebun.value.value!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!, width: 1,),
                            color: AppColors.monochromeColorSwatch[50],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                                      "Pilih Tahun Anggaran"
                                  ),
                                ],
                              ),
                            ),
                            value: controller.idAnggaran.value.value,
                            icon: Icon(Icons.keyboard_arrow_down, color: controller.listAnggaran.value!=null?AppColors.primary:AppColors.monochromeColorSwatch[300]!,),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(),
                            onChanged: (int? newValue) {
                              controller.idAnggaran.value.value = newValue;
                              controller.fetchSummary();
                            },
                            alignment: AlignmentDirectional.topCenter,
                            style: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                            items: controller.listAnggaran.map((e) {
                              return DropdownMenuItem<int>(
                                  value: e.id, child: Text(e.tahun??"", style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700]),)
                              );
                            }).toList(),
                            selectedItemBuilder: (context){
                              return controller.listAnggaran.map((e) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pilih Tahun Anggaran",
                                      style: AppInter.overlineText.copyWith(color: AppColors.primary),
                                    ),
                                    Text(e.tahun??"", style: AppInter.body.copyWith(color: AppColors.monochromeColorSwatch[700])),
                                  ],
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ),
                    );
                  }),
                  Expanded(
                    child: Obx((){
                      if(controller.idAnggaran.value.value==null){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/select-rafiki.svg",
                              height: 256,
                            ),
                            SizedBox(height: 12,),
                            Text(
                              "Tahun Anggaran belum dipilih",
                              style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Harap pilih data tahun anggaran terlebih dahulu.",
                              style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                            ),
                          ],
                        );
                      }
                      return RefreshIndicator(
                        backgroundColor: Colors.white,
                        onRefresh: () async {
                          controller.fetchSummary();
                        },
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    // SizedBox(height: 16,),
                                    Text(
                                      "Keuntungan",
                                      style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                    ),
                                    SizedBox(height: 4,),
                                    Text(
                                      formatCurrency.format(controller.summary.value.value?.keuntungan??0),
                                      style: AppDmSans.smallTitle.copyWith(color: AppColors.semanticColorSwatch[500], fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Pendapatan",
                                                style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                              ),
                                              SizedBox(height: 4,),
                                              Text(
                                                formatCurrency.format(controller.summary.value.value?.pendapatan??0),
                                                style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(width: 16,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total Biaya Keseluruhan",
                                                style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                              ),
                                              SizedBox(height: 4,),
                                              Text(
                                                formatCurrency.format(controller.summary.value.value?.pengeluaran??0),
                                                style: AppDmSans.smallTitle.copyWith(color: AppColors.dangerColorSwatch[500], fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                  ],
                                ),
                              ),
                              controller.summary.value.value?.anggaran?.detailAnggaran?.length==0?Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 32,),
                                        Image.asset(
                                          "assets/empty.png",
                                          width: 128,
                                        ),
                                        SizedBox(height: 12,),
                                        Text(
                                          "Summary belum tersedia",
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
                              ):ListView.builder(
                                itemCount: controller.summary.value.value?.anggaran?.detailAnggaran?.length??0,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var detail = controller.summary.value.value?.anggaran?.detailAnggaran?[index];
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
                                                child: Text(
                                                  detail?.namaKategori??"-",
                                                  style: AppDmSans.smallTitle,
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                color: AppColors.border,
                                                thickness: 1,
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: detail?.itemAnggaran?.length??0,
                                                itemBuilder: (BuildContext context, int index) {
                                                  var item = detail?.itemAnggaran?[index];
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      if(index!=0)...[
                                                        Divider(
                                                          height: 1,
                                                          color: AppColors.border,
                                                          thickness: 1,
                                                        ),
                                                      ],
                                                      Padding(
                                                        padding: const EdgeInsets.all(16),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: [
                                                            Text(
                                                              item?.namaSubKategori??"-",
                                                              style: AppDmSans.smallTitle,
                                                            ),
                                                            SizedBox(height: 16,),
                                                            Divider(
                                                              height: 1,
                                                              color: AppColors.border,
                                                              thickness: 1,
                                                            ),
                                                            SizedBox(height: 16,),
                                                            ListView.builder(
                                                              shrinkWrap: true,
                                                              physics: NeverScrollableScrollPhysics(),
                                                              itemCount: item?.barang?.length??0,
                                                              itemBuilder: (BuildContext context, int index) {
                                                                var barang = item?.barang?[index];
                                                                return Padding(
                                                                  padding: EdgeInsets.only(top: index==0?0:32),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        "${barang?.kuantitas} ${barang?.satuan} ${barang?.namaBarang}",
                                                                        style: AppDmSans.smallTitle,
                                                                      ),
                                                                      Text(
                                                                        formatCurrency.format(barang?.jumlahBiaya??0),
                                                                        style: AppDmSans.smallTitle,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              SizedBox(height: 8,),
                                              Padding(
                                                padding: const EdgeInsets.all(16),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total Biaya",
                                                      style: AppDmSans.smallBody,
                                                    ),
                                                    Text(
                                                      formatCurrency.format(detail?.totalBiayaKategori??0),
                                                      style: AppDmSans.smallTitle.copyWith(fontWeight: FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        if(index!=(controller.summary.value.value?.anggaran?.detailAnggaran?.length??0)-1)...[
                                          SizedBox(height: 8,)
                                        ]else...[
                                          SizedBox(height: 16,)
                                        ]
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
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
    );
  }
}
