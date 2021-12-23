import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:situngtani/utils/colors.dart';

class AppTextFormField extends StatefulWidget {

  String label;
  bool obscureText;
  TextInputType keyboardType;
  TextCapitalization textCapitalization;
  TextEditingController controller;
  Widget? trailing;
  int? maxLines;
  int? maxLength;
  bool enabled;
  bool required;
  String? fieldName;
  Function(String?)? onChanged;
  Widget? leading;

  AppTextFormField({Key? key, this.leading, this.onChanged, this.fieldName, this.required = true, this.enabled = true, this.label = "", this.maxLength, this.obscureText = false, this.textCapitalization = TextCapitalization.sentences, this.keyboardType = TextInputType.text, required this.controller, this.trailing, this.maxLines}) : super(key: key);
  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {

  FocusNode _focusNode = new FocusNode();
  bool isObscure = false;
  bool hasError = false;
  @override
  void initState() {
    // TODO: implement initState
    if(widget.obscureText) this.isObscure = true;
    this._focusNode.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.enabled?AppColors.monochromeColorSwatch[50]:AppColors.monochromeColorSwatch[100],
        // border: Border.all(color: _focusNode.hasFocus?AppColors.textPrimary:AppColors.textSecondary, width: 1,),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: widget.obscureText||widget.trailing!=null?0:16, bottom: widget.maxLength!=null?8:(hasError?8:0)),
        child: Row(
          children: [
            if(widget.leading!=null)...[
              widget.leading!,
              SizedBox(width: 10,)
            ],
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                cursorColor: AppColors.primary,
                focusNode: _focusNode,
                obscureText: isObscure,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                maxLines: widget.obscureText?1:widget.maxLines,
                maxLength: widget.maxLength,
                enabled: widget.enabled,
                onChanged: widget.onChanged,
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: widget.enabled?AppColors.textInput:AppColors.monochromeColorSwatch[500], height: 18/12),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 6, bottom: 8),
                  labelText: widget.label,
                  labelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: _focusNode.hasFocus?AppColors.textPrimary:AppColors.textSecondary, height: 18/12),
                  border: InputBorder.none,
                ),
                validator: (value){
                  if(widget.required && value != null && value.isEmpty) {
                    // setState(() {
                    //   validationMesage = "The ${widget.fieldName} field must be filled.";
                    // });
                    setState(() {
                      hasError = true;
                    });
                    return "${widget.fieldName} wajib diisi.";
                  }
                  setState(() {
                    hasError = false;
                  });
                  return null;
                },
              ),
            ),
            if(widget.obscureText)...[
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                child: IconButton(
                  icon: Icon(this.isObscure?FeatherIcons.eye:FeatherIcons.eyeOff, color: AppColors.icon, size: 16),
                  onPressed: () {
                    this.isObscure = !this.isObscure;
                    setState(() {

                    });
                  },
                ),
              )
            ]else if(widget.trailing!=null)...[
              widget.trailing!
            ]
          ],
        ),
      ),
    );
  }
}
