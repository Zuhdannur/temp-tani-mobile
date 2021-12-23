import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:situngtani/components/app_button_primary.dart';
import 'package:situngtani/pages/login_page.dart';
import 'package:situngtani/utils/colors.dart';
import 'package:situngtani/utils/font_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(46),
              decoration: BoxDecoration(
                  color: AppColors.gray50,
                  borderRadius: BorderRadius.circular(1000)
              ),
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 32,),
              Column(
                children: [
                  SvgPicture.asset("assets/logo.svg"),
                  SizedBox(height: 12,),
                  Text(
                    "Hitung Tani",
                    style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/bg-login.png"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                      style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                    ),
                  ),
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: AppButtonPrimary(
                            label: "Mulai Sekarang",
                            onTap: (){
                              Get.to(()=>LoginPage());
                            }
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
