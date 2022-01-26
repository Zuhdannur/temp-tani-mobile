import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hitungtani/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Center(
            child: Container(
                width: double.infinity,
                height: 64,
                color: Colors.transparent,
                child: Image.asset(
                  "assets/logo-alt-splash.png",
                )
            ),
          ),
        ),
      ),
    );
  }
}
