import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.icon,
    required this.hintText,
    required this.inputType,
    required this.action,
    this.prefix,
    this.controller,
    this.labelText,
    super.key,
    this.inputFormatters,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final Icon icon;
  final String hintText;
  final String? prefix;
  final TextInputType inputType;
  final TextInputAction action;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) => customField;

  Widget get customField => Padding(
        padding: PaddingConstant.onlyRight3,
        child: TextFormField(
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefixText: prefix,
            prefixStyle: TextStyle(color: ColorConstant.textColor),
            icon: icon,
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: ColorConstant.hintTextColor),
          ),
          keyboardType: inputType,
          textInputAction: action,
        ),
      );
}
