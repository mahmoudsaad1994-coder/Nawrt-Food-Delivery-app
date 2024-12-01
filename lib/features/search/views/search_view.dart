import 'package:flutter/material.dart';

import 'search_home_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: SearchHomeBody()));
  }
}
