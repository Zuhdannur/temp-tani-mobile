import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/components/app_button_primary.dart';
import 'package:hitungtani/components/app_text_form_field.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/helpers.dart';

class AnggaranFormPage extends StatelessWidget {
  const AnggaranFormPage({Key? key}) : super(key: key);

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
          "Tambah Anggaran",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500, height: 30/20, color: Colors.white),
        ),
        leading: BackButton(color: Colors.white,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AppTextFormField(
                              label: "Nama Anggaran",
                              controller: TextEditingController(),
                              fieldName: "Nama Anggaran",
                              onChanged: (value){

                              },
                            ),
                            SizedBox(height: 16,),
                            AppTextFormField(
                              label: "Keterangan Anggaran",
                              controller: TextEditingController(),
                              fieldName: "Keterangan",
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              maxLength: 500,
                              onChanged: (value){

                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: AppHelpers.cardBoxShadow,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: MediaQuery.of(context).viewInsets.bottom+16),
        child: AppButtonPrimary(
          onTap: (){

          },
          label: "Simpan",
        ),
      ),
    );
  }
}