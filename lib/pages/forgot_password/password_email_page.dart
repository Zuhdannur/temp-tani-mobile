import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/pages/forgot_password/password_otp_page.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';

class PasswordEmailPage extends StatelessWidget {
  PasswordEmailPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Container(
                      height: (MediaQuery.of(context).size.width/3)+(28*2)+MediaQuery.of(context).padding.top,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            left: -64,
                            top: MediaQuery.of(context).padding.top,
                            child: Container(
                              padding: EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                  color: AppColors.gray50,
                                  borderRadius: BorderRadius.circular(1000)
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width/3,
                                height: MediaQuery.of(context).size.width/3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FeatherIcons.arrowLeft
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    "Lupa Kata Sandi",
                                    style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                  ),
                                  SizedBox(height: 12,),
                                  Text(
                                    "Silakan masukkan Email Anda untuk menerima OTP reset kata sandi.",
                                    style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextFormField(
                              label: "Masukkan email anda",
                              controller: TextEditingController(),
                              fieldName: "Email",
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value){

                              },
                              leading: Icon(FeatherIcons.mail, color: AppColors.icon, size: 16,),
                            ),
                            SizedBox(height: 24,),
                            AppButtonPrimary(
                                label: "Selanjutnya",
                                onTap: (){
                                  Get.to(()=>PasswordOtpPage());
                                }
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
    );
  }
}
