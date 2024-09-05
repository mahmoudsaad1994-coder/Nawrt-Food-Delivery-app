import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../core/utils/text_selection.dart';

class TestFieldWidget extends StatelessWidget {
  const TestFieldWidget({
    super.key,
    required this.width,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    required this.handlePaste,
    this.onTap,
  });
  final double width;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final FocusNode focusNode;
  final void Function(String) handlePaste;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * .12,
      width: width * .12,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffEAE7E3).withOpacity(.5),
      ),
      child: TextFormField(
        controller: controller,
        maxLength: 1,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        onChanged: onChanged,
        focusNode: focusNode,
        onTap: onTap,
        style: TextStyle(
          fontSize: width * .05,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        selectionControls: CustomMaterialTextSelectionControl(
            onPaste: (final TextSelectionDelegate delegate) async {
          final ClipboardData? data =
              await Clipboard.getData(Clipboard.kTextPlain);
          final text = data?.text ?? '';
          handlePaste(text);
        }),
      ),
    );
  }
}
