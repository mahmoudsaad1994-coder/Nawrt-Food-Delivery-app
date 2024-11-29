import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/constants.dart';

class WalletTextfieldWidget extends StatelessWidget {
  const WalletTextfieldWidget(
      {super.key, required this.text, required this.controller});
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontSize: context.width * .04,
      ),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: k96908AColor),
        filled: true,
        fillColor: kEAE7E380Color,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
