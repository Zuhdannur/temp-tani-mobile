import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
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
                                "Identitas Kebun",
                                style: AppDmSans.subTitle,
                              ),
                              SizedBox(height: 4,),
                              Text(
                                "Informasi umum identitas kebun.",
                                style: AppDmSans.overlineText,
                              ),
                            ],
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

                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: AppColors.border,
                    thickness: 1
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Nama Kebun",
                          style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "Kebun Strawberry",
                          style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "Alamat Kebun",
                          style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 4,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                "Jl. Ir. H. Djuanda No. 205, Dago, Kecamatan Coblong, Kota Bandung, Jawa Barat 40135",
                                style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: (){

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.buttonSecondary.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(4)

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    child: Icon(
                                      FeatherIcons.map,
                                      color: AppColors.icon,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
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
                                "Jenis Tanaman",
                                style: AppDmSans.subTitle,
                              ),
                              SizedBox(height: 4,),
                              Text(
                                "Informasi jenis tanaman yang ditanam di kebun.",
                                style: AppDmSans.overlineText,
                              ),
                            ],
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

                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: AppColors.border,
                    thickness: 1
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Jenis Tanaman",
                                    style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    "Strawberry",
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
                                    "Luas Tanah",
                                    style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    "300m2",
                                    style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jarak Tanam",
                                    style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    "10cm",
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
                                    "Waktu Penanaman",
                                    style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    "5 Bulan",
                                    style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "Perkiraan Hasil Panen per Ubin",
                          style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "10 Kg",
                          style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "Harga Satuan per Hasil Panen",
                          style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "Rp. 20.000",
                          style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Perkiraan Total Populasi Tanaman",
                          style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "200 Bibit",
                          style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "Perkiraan Jumlah Hasil Panen",
                          style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "100 Kg",
                          style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
