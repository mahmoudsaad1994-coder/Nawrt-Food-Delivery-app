import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../../data.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const CustomSliverAppBar(
              inLayout: true,
              title: 'عربة التسوق',
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(width * .06),
          child: cartList.isEmpty
              ? Center(
                  child: AspectRatio(
                    aspectRatio: .5,
                    child: Image.asset(AssetsData.undrawEmptyCart),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
