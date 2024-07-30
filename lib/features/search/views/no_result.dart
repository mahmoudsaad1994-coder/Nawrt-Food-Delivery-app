import 'package:flutter/material.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            'لم يتم العثور على نتائج للبحث',
          ),
        ],
      ),
    );
  }
}
