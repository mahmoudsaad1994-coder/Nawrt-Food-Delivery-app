import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawrt/core/utils/extensions.dart';
import 'package:nawrt/core/utils/responsive.dart';

import '../../features/search/manager/search_cubit.dart';
import '../../features/search/manager/search_states.dart';
import '../constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Responsive.isPortrait(context) ? context.width : context.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size * .06),
      height: size * .1,
      width: double.infinity,
      child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SearchCubit.get(context);
            return SearchBar(
              controller: cubit.searchController,
              hintText: 'بحث',
              textStyle: WidgetStatePropertyAll(TextStyle(
                color: k0xff867e7eColor.withOpacity(.5),
              )),
              hintStyle: WidgetStatePropertyAll(TextStyle(
                fontSize: size * .04,
                color: k0xff867e7eColor,
              )),
              autoFocus: true,
              onChanged: (value) {},
              leading: Icon(
                Icons.search,
                color: k0xff867e7eColor.withOpacity(.7),
                size: size * .06,
              ),
              trailing: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune,
                      color: k0xff867e7eColor,
                      size: size * .06,
                    )),
              ],
              backgroundColor: const WidgetStatePropertyAll(k0xfff4f3f1Color),
              padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: size * .03)),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
    );
  }
}
