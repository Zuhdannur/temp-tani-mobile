import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/utils/colors.dart';

class AppButtonSecondary extends StatefulWidget {

  String label;
  bool enabled;
  final void Function()? onTap;
  bool isLoading;
  Color? foreColor;

  AppButtonSecondary({Key? key, this.onTap, this.label = "", this.enabled = true, this.isLoading = false, this.foreColor}) : super(key: key);

  @override
  _AppButtonSecondaryState createState() => _AppButtonSecondaryState();
}

class _AppButtonSecondaryState extends State<AppButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
          // color: widget.enabled?AppColors.primary:AppColors.disabled,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: widget.enabled?(widget.foreColor??AppColors.primary):AppColors.disabled, )
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: !widget.enabled||widget.isLoading?null:widget.onTap,
          child: Center(
            child: widget.isLoading?Center(child: SizedBox(width: 24, height: 24,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white), strokeWidth: 3,))):Text(
              widget.label,
              style: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w500, color: widget.enabled?(widget.foreColor??AppColors.primary):AppColors.disabled, height: 20/14),
            ),
          ),
        ),
      ),
    );
  }
}
