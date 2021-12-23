import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:hitungtani/utils/helpers.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({Key? key}) : super(key: key);

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
                                "Lorem ipsum dolor sit amet.",
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

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.buttonSecondary.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(4)

                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Icon(
                                  FeatherIcons.printer,
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 16,),
                                  Text(
                                    "Keuntungan",
                                    style: AppDmSans.smallBody.copyWith(color: AppColors.textSecondary),
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    "Rp. 2.000.000",
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
                                              "Rp. 5.000.000",
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
                                              "Rp. 3.000.000",
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
                            ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
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
                                                "Biaya Pokok",
                                                style: AppDmSans.smallTitle,
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: AppColors.border,
                                              thickness: 1,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(16),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      Text(
                                                        "Biaya Tenaga Kerja",
                                                        style: AppDmSans.smallTitle,
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Divider(
                                                        height: 1,
                                                        color: AppColors.border,
                                                        thickness: 1,
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "1 Bulan Upah",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                          Text(
                                                            "Rp. 1.000.000",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                        ],
                                                      ),
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
                                                        "Peralatan",
                                                        style: AppDmSans.smallTitle,
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Divider(
                                                        height: 1,
                                                        color: AppColors.border,
                                                        thickness: 1,
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "2 Buah Cangkul",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                          Text(
                                                            "Rp. 500.000",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 32,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "2 Buah Penyiram",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                          Text(
                                                            "Rp. 500.000",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                        ],
                                                      ),
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
                                                        "Bibit",
                                                        style: AppDmSans.smallTitle,
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Divider(
                                                        height: 1,
                                                        color: AppColors.border,
                                                        thickness: 1,
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "1 Kg Bibit",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                          Text(
                                                            "Rp. 500.000",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 32,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "1 Kg Bibit",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                          Text(
                                                            "Rp. 500.000",
                                                            style: AppDmSans.smallTitle,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                                                        "Rp. 3.000.000",
                                                        style: AppDmSans.smallTitle.copyWith(fontWeight: FontWeight.w700),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
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
                          ],
                        ),
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
