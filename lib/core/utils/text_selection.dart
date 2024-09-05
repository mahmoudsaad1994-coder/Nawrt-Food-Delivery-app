import 'package:flutter/material.dart';

class CustomMaterialTextSelectionControl extends MaterialTextSelectionControls {
  ValueChanged<TextSelectionDelegate> onPaste;

  CustomMaterialTextSelectionControl({
    required this.onPaste,
  });

  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) {
    onPaste(delegate);
    return super.handlePaste(delegate);
  }
}
