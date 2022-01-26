import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hitungtani/controllers/beranda_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';

class SelectKebun extends StatelessWidget {
  SelectKebun({Key? key}) : super(key: key);
  
  BerandaController controller = Get.put(BerandaController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      onRefresh: () async {
        controller.kebun.value.value = null;
        controller.fetchKebun();
        if(controller.idKebun.value.value!=null){
          controller.fetchAnggaran();
        }
      },
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/select-rafiki.svg",
                    height: 256,
                  ),
                  SizedBox(height: 12,),
                  Text(
                    "Kebun belum dipilih",
                    style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Harap pilih data kebun terlebih dahulu.",
                    style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
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
