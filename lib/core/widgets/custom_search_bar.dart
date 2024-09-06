import 'package:flutter/material.dart';
import 'package:nawrt/core/utils/responsive.dart';

import '../../constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.isHome = false});

  final bool isHome;
  @override
  Widget build(BuildContext context) {
    var size = Responsive.isPortrait(context)
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size * .06),
      height: size * .1,
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SearchBar(
          hintText: 'بحث',
          textStyle: const WidgetStatePropertyAll(TextStyle(
            color: kBlackColor,
          )),
          hintStyle: WidgetStatePropertyAll(TextStyle(
            fontSize: size * .04,
          )),
          onChanged: (value) {},
          onSubmitted: (searchText) {},
          onTap: () {
            if (isHome) {
              //go to search screen
            }
          },
          leading: Icon(
            Icons.search,
            color: k0xff867e7eColor,
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
              borderRadius: BorderRadius.circular(size * .08),
            ),
          ),
        ),
      ),
    );
  }
}
