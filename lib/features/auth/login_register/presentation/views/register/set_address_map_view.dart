import 'package:flutter/material.dart';

import 'widgets/set_address_map_widgets/set_adress_map_bottom_item_.dart';
import 'widgets/set_address_map_widgets/set_adress_map_top_item_.dart';

class SetAddressMapView extends StatelessWidget {
  const SetAddressMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SetAddressMapViewTopItem(),
          SetAressMapBotomView(),
        ],
      ),
    );
  }
}
