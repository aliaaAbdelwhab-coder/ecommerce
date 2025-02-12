import 'package:ecommerce/utils/appColors.dart';
import 'package:flutter/material.dart';

class Textfieldui extends StatelessWidget {
  Color borderColor;
  Icon? suffixicon;
  Icon? prefixicon;
  String? hintText;
  String? labelText;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  TextEditingController controller;
  int maxLines;
  String? Function(String?)? validator;
  Color ?fillColor;
  TextInputType? KeyboardType;
  Textfieldui({
    this.borderColor = Appcolors.greyColor,
    this.prefixicon,
    this.suffixicon,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.maxLines = 1,
    this.validator,
    this.fillColor,
    required this.controller,
    this.KeyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        keyboardType: KeyboardType,
        cursorColor: fillColor ==null? Appcolors.whiteColor : fillColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ==null? Appcolors.whiteColor : fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          suffixIcon: suffixicon,
          prefixIcon: prefixicon,
          hintText: hintText,
          labelText: labelText,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
        ));
  }
}
