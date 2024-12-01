import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';

import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custtom_sliver_app_bar.dart';
import '../manager/search_cubit.dart';
import '../manager/search_states.dart';
import 'widgets/set_price_filter.dart';
import 'widgets/show_as.dart';

class SearchFilterView extends StatelessWidget {
  const SearchFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchCubit cubit = SearchCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const CustomSliverAppBar(
                inLayout: false,
                title: 'الفلتر',
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: width * .1),
                    ShowAs(cubit: cubit),
                    SetPriceFilter(
                      cubit: cubit,
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: width * .06),
                      height: width * .15,
                      child: CustomButton(
                        onPressed: () {},
                        child: Text(
                          'تطبيق الفلتر',
                          style: Styles.textStyle16old.copyWith(
                            fontSize: width * .05,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * .1,
                    )
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
