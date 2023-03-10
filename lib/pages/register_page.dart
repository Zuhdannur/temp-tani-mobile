import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/controllers/akun_controller.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  AkunController akunController = Get.put(AkunController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Obx((){
          return LoadingOverlay(
            isLoading: akunController.isLoading.value,
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
                              // Positioned(
                              //   top: -32,
                              //   right: -32,
                              //   child: Container(
                              //     padding: EdgeInsets.all(28),
                              //     decoration: BoxDecoration(
                              //         color: AppColors.gray50,
                              //         borderRadius: BorderRadius.circular(1000)
                              //     ),
                              //     child: Container(
                              //       width: 128,
                              //       height: 128,
                              //       decoration: BoxDecoration(
                              //           color: Colors.white,
                              //           borderRadius: BorderRadius.circular(100)
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 32),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Daftar",
                                        style: AppDmSans.heading3.copyWith(color: AppColors.primary),
                                      ),
                                      SizedBox(height: 12,),
                                      Text(
                                        "Lengkapi isian dibawah ini.",
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
                                  label: "Masukkan nama lengkap anda",
                                  controller: akunController.userRegister.namaController,
                                  fieldName: "Nama Lengkap",
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value){
                                    akunController.userRegister.namaLengkap = value;
                                  },
                                  leading: Icon(FeatherIcons.user, color: AppColors.icon, size: 16,),
                                ),
                                SizedBox(height: 12,),
                                AppTextFormField(
                                  label: "Masukkan email anda",
                                  controller: akunController.userRegister.emailController,
                                  fieldName: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value){
                                    akunController.userRegister.email = value;
                                  },
                                  leading: Icon(FeatherIcons.mail, color: AppColors.icon, size: 16,),
                                ),
                                SizedBox(height: 12,),
                                AppTextFormField(
                                  label: "Masukkan nomor ponsel anda",
                                  controller: akunController.userRegister.teleponController,
                                  fieldName: "Nomor Ponsel",
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value){
                                    akunController.userRegister.telepon = value;
                                  },
                                  leading: Icon(FeatherIcons.phone, color: AppColors.icon, size: 16,),
                                ),
                                SizedBox(height: 12,),
                                AppTextFormField(
                                  label: "Masukkan kata sandi",
                                  controller: akunController.userRegister.passwordController,
                                  fieldName: "Kata Sandi",
                                  onChanged: (value){
                                    akunController.userRegister.password = value;
                                  },
                                  obscureText: true,
                                  leading: Icon(FeatherIcons.lock, color: AppColors.icon, size: 16,),
                                ),
                                SizedBox(height: 12,),
                                AppTextFormField(
                                  label: "Konfirmasi kata sandi",
                                  controller: akunController.userRegister.confirmPasswordController,
                                  fieldName: "Konfirmasi Kata Sandi",
                                  onChanged: (value){
                                    akunController.userRegister.confirmPassword = value;
                                  },
                                  obscureText: true,
                                  leading: Icon(FeatherIcons.lock, color: AppColors.icon, size: 16,),
                                ),
                                SizedBox(height: 24,),
                                AppButtonPrimary(
                                    label: "Daftar",
                                    onTap: (){
                                      if(_formKey.currentState!.validate()){
                                        akunController.register();
                                      }
                                    }
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sudah memiliki akun ?",
                                      style: AppDmSans.smallTitle.copyWith(color: AppColors.text),
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Get.back();
                                      },
                                      child: Text(
                                        "Masuk disini",
                                        style: AppDmSans.smallTitle.copyWith(color: AppColors.accent),
                                      ),
                                    ),
                                  ],
                                )
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
          );
        }),
      ),
    );
  }
}
