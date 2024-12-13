import 'package:flutter/material.dart';

import '../utils/styles.dart';

class ButtonTile extends StatelessWidget {
  const ButtonTile(
      {super.key, this.onTap, required this.icon, required this.name});
  final void Function()? onTap;
  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: MediaQuery.of(context).size.width * .06,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .04,
          ),
          Text(
            name,
            style: Styles.textStyleXL(context,
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
