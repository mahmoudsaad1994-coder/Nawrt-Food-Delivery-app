import 'package:flutter/material.dart';

import 'shopping_cart_view.dart';

class ShoppingCartViewOutside extends StatelessWidget {
  const ShoppingCartViewOutside({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShoppingCartView(inlayout: false),
    );
  }
}
