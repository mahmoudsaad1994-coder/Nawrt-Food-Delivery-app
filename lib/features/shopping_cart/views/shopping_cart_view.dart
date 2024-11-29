import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/utils/assets.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../../home/presentation/manager/cubit.dart';
import '../../home/presentation/manager/states.dart';
import 'shopping_cart_body.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key, this.inlayout = true});
  final bool inlayout;
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return SafeArea(
      child: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                CustomSliverAppBar(
                  inLayout: inlayout,
                  title: 'عربة التسوق',
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.all(width * .06),
                    child: MainCubit.get(context).cartItems.isEmpty
                        ? Center(
                            child: AspectRatio(
                              aspectRatio: .5,
                              child: Image.asset(AssetsData.undrawEmptyCart),
                            ),
                          )
                        : ShoppingCartBody(cubit: MainCubit()),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
