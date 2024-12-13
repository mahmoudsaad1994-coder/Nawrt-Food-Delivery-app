import 'package:flutter/material.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentsView'),
      ),
      body: const Center(
        child: Text('PaymentsView'),
      ),
    );
  }
}
