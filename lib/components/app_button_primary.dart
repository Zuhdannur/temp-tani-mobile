import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:situngtani/utils/colors.dart';

class AppButtonPrimary extends StatefulWidget {

  String label;
  bool enabled;
  final void Function()? onTap;
  bool isLoading;
  Widget? image;

  AppButtonPrimary({Key? key, this.label = "", this.enabled = true, required this.onTap, this.isLoading = false, this.image}) : super(key: key);
  @override
  _AppButtonPrimaryState createState() => _AppButtonPrimaryState();
}

class _AppButtonPrimaryState extends State<AppButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
          color: widget.enabled?AppColors.primary:AppColors.disabled,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: !widget.enabled||widget.isLoading?null:widget.onTap,
          child: Center(
            child: widget.isLoading?Center(child: SizedBox(width: 24, height: 24,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white), strokeWidth: 3,))):Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(widget.image!=null)...[
                  widget.image!,
                  SizedBox(width: 8,)
                ],
                Text(
                  widget.label,
                  style: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white, height: 20/14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
