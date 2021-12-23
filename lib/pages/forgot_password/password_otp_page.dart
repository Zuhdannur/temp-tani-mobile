import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:situngtani/components/app_button_primary.dart';
import 'package:situngtani/components/app_text_form_field.dart';
import 'package:situngtani/pages/forgot_password/password_change_page.dart';
import 'package:situngtani/utils/colors.dart';
import 'package:situngtani/utils/font_styles.dart';

class PasswordOtpPage extends StatelessWidget {
  PasswordOtpPage({Key? key}) : super(key: key);

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
                                    "Verifikasi",
                                    style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                  ),
                                  SizedBox(height: 12,),
                                  Text(
                                    "Kami telah mengirimkan kode autentikasi ke asepgumasep@gmail.com, mohon periksa email Anda.",
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
                            PinCodeTextField(
                                backgroundColor: Colors.transparent,
                                showCursor: false,
                                textStyle: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.textPrimary, height: 36/24),
                                keyboardType: TextInputType.number,
                                // errorAnimationController: errorController,
                                // controller: pinController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                animationType: AnimationType.fade,
                                // validator: (value){
                                //   if(value.isEmpty || value.length < 6){
                                //     return "Please input your 6 digit number";
                                //   }
                                //   return null;
                                // },
                                pinTheme: PinTheme(
                                    borderRadius: BorderRadius.circular(4),
                                    fieldWidth: (MediaQuery.of(context).size.width/4)-26,
                                    fieldHeight: (MediaQuery.of(context).size.width/4)-26,
                                    inactiveFillColor: AppColors.gray50,
                                    activeFillColor: AppColors.gray50,
                                    inactiveColor: AppColors.gray50,
                                    activeColor: AppColors.gray50,
                                    selectedColor: AppColors.primary,
                                    selectedFillColor: AppColors.gray50,
                                    shape: PinCodeFieldShape.box,
                                    borderWidth: 2
                                ),
                                enableActiveFill: true,
                                appContext: context,
                                length: 4,
                                onCompleted: (value){

                                },
                                onChanged: (value) {

                                }
                            ),
                            TextButton(
                              onPressed: (){

                              },
                              child: Text(
                                "Kirim Ulang Kode Autentikasi (04:59)",
                                style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textSecondary, height: 20/14),
                              ),
                            ),
                            SizedBox(height: 10,),
                            AppButtonPrimary(
                                label: "Selanjutnya",
                                onTap: (){
                                  Get.to(()=>PasswordChangePage());
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
