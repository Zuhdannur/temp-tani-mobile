import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:hitungtani/controllers/home_controller.dart';
import 'package:hitungtani/pages/beranda/beranda_page.dart';
import 'package:hitungtani/pages/user_page.dart';
import 'package:hitungtani/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        brightness: Brightness.dark,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.pageIdx.value==0?BerandaPage():UserPage();
        }),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.pageIdx.value,
          onTap: (value){
            controller.pageIdx.value = value;
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Icon(FeatherIcons.home, color: controller.pageIdx.value==0?AppColors.primary:null,),
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Icon(FeatherIcons.user, color: controller.pageIdx.value==1?AppColors.primary:null,),
              ),
              label: "Akun",
            ),
          ],
        );
      }),
    );
  }
}
