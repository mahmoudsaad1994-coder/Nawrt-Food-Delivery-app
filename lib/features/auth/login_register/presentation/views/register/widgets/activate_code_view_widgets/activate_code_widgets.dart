import 'package:flutter/material.dart';

import 'test_field_widget.dart';

class ActivateCodeWidgets extends StatefulWidget {
  const ActivateCodeWidgets({super.key, required this.width});
  final double width;

  @override
  State<ActivateCodeWidgets> createState() => _ActivateCodeWidgetsState();
}

class _ActivateCodeWidgetsState extends State<ActivateCodeWidgets> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  String combinedCode = '';

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  handlePaste(text) {
    //check the text is only number
    String pastedText = text.replaceAll(RegExp(r'[^\d]'), '');
    //check
    if (pastedText.length != 6) {
      return;
    }
    //past in 6 fields
    for (int i = 0; i < pastedText.length; i++) {
      _controllers[i].text = pastedText[i];
    }
    //scope next field
    FocusScope.of(context).requestFocus(_focusNodes[pastedText.length - 1]);
  }

  void _selectAllText(TextEditingController controller) {
    // Select all text in the given controller
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(6, (index) {
          return TestFieldWidget(
            handlePaste: handlePaste,
            width: widget.width,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            onTap: () {
              _selectAllText(_controllers[index]);
            },
            onChanged: (value) {
              if (value.length == 1 && index < _controllers.length - 1) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          );
        }),
      ),
    );
  }
}
