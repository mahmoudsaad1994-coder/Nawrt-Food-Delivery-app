import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size(1, 10),
            child: Divider(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Offers',
            style: Styles.textStyleXXL(
              context,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * .04,
            ),
            child: Row(
              children: [
                Image.asset(
                  IconAssetsManager.offerIcon,
                  width: screenSize.width * .07,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: screenSize.width * .04,
                ),
                Column(
                  children: [
                    Text(
                      'Get 10% off on all orders',
                      style: Styles.textStyleXXL(
                        context,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Valid until 01 October, 2023',
                      style: Styles.textStyleXXL(
                        context,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Divider(
            height: screenSize.height * .04,
            color: Colors.grey.withOpacity(.2),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
