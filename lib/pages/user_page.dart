import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_secondary.dart';
import 'package:hitungtani/pages/login_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';

import 'akun_menu.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.monochromeColorSwatch[50],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        brightness: Brightness.dark,
        // toolbarHeight: 0,
        elevation: 0,
        title: Text(
          "Akun",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Nama Lengkap",
                              style: AppDmSans.body.copyWith(color: AppColors.textSecondary),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "Rizki Banyu Firdaus",
                              style: AppDmSans.title.copyWith(color: AppColors.text),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Email",
                              style: AppDmSans.body.copyWith(color: AppColors.textSecondary),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "rbanyufirdaus@gmail.com",
                              style: AppDmSans.title.copyWith(color: AppColors.text),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Nomor Telepon",
                              style: AppDmSans.body.copyWith(color: AppColors.textSecondary),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "082212345678",
                              style: AppDmSans.title.copyWith(color: AppColors.text),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Info Lainnya",
                          style: AppDmSans.title.copyWith(color: AppColors.monochromeColorSwatch[900]),
                        ),
                      ),
                      AkunMenu(
                        label: "Kebijakan Privasi",
                        icon: Icons.shield,
                        onTap: (){

                        },
                      ),
                      SizedBox(height: 24,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppButtonSecondary(
                          label: "Keluar dari Akun",
                          foreColor: AppColors.danger500,
                          onTap: (){
                            Get.offAll(()=>LoginPage());
                          },
                        ),
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}