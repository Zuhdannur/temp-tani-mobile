import 'package:flutter/material.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';

class AkunMenu extends StatelessWidget {

  final String? label;
  final void Function()? onTap;
  final IconData? icon;

  const AkunMenu({Key? key, this.label, this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          leading: Icon(icon, color: AppColors.primaryColorSwatch[500],),
          horizontalTitleGap: 0,
          title: Text(
            label??"",
            style: AppDmSans.subTitle.copyWith(color: AppColors.monochromeColorSwatch[700]),
          ),
          trailing: Icon(
              Icons.chevron_right
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Divider(
            height: 0,
            thickness: 1,
            color: AppColors.monochromeColorSwatch[100],
          ),
        ),
      ],
    );
  }
}
