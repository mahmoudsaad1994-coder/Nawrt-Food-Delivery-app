import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.color,
    this.suffixIcon,
    this.controller,
    this.hidden = false,
    this.validator,
    this.suffixOnPressed,
  });
  final String hintText;
  final IconData icon;
  final IconData? suffixIcon;
  final Color? color;
  final TextEditingController? controller;
  final bool hidden;
  final String? Function(String?)? validator;
  final void Function()? suffixOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLines: 1,
      obscureText: hidden,
      validator: validator,
      style: TextStyle(
        fontSize: Responsive.isMobile(context) ? 16 : 30,
      ),
      decoration: InputDecoration(
        fillColor: color ?? const Color(0xffEAE7E3).withOpacity(.5),
        errorStyle: TextStyle(
          backgroundColor: color ?? const Color(0xffEAE7E3).withOpacity(.5),
          fontSize: Responsive.isMobile(context) ? 16 : 25,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
        isDense: true,
        hintStyle: TextStyle(
          fontSize: Responsive.isMobile(context) ? 16 : 30,
        ),
        icon: Icon(
          icon,
          size: MediaQuery.of(context).size.width * .05,
        ),
        hintText: hintText,
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            size: MediaQuery.of(context).size.width * .05,
          ),
          onPressed: suffixOnPressed,
        ),
      ),
    );
  }
}
