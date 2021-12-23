import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitungtani/utils/colors.dart';

class AppAlert {
  static Widget danger({String message = "", dismissable = false}){
    return CustomAlert(message: message, dismissable: dismissable, bgColor: AppColors.danger100, foreColor: AppColors.danger500,);
  }
}

class CustomAlert extends StatefulWidget {

  String message;
  bool dismissable;
  Color bgColor;
  Color foreColor;

  CustomAlert({Key? key, this.message = "", this.dismissable = false, this.bgColor = Colors.transparent, this.foreColor = Colors.transparent}) : super(key: key);

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {

  bool show = true;
  @override
  Widget build(BuildContext context) {
    return !show?Container(height: 0,):Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: widget.bgColor,
          border: Border.all(color: widget.foreColor, width: 1),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                widget.message,
                style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400, color: widget.foreColor, height: 16/10),
              ),
            ),
          ),
          if(widget.dismissable)...[
            SizedBox(
              width: 36,
              height: 36,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                child: IconButton(
                  iconSize: 16,
                  icon: Icon(Icons.close, color: widget.foreColor),
                  onPressed: () {
                    this.show = false;
                    setState(() {

                    });
                  },
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
