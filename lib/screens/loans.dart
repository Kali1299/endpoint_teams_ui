import 'package:flutter/material.dart';

import '../helper/app_color.dart';
import '../helper/font_style.dart';

class Loans extends StatelessWidget {
  const Loans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColor.darkMode.value=(MediaQuery.of(context).platformBrightness==Brightness.dark);
    return ValueListenableBuilder(
      valueListenable: AppColor.darkMode,
      builder: (context,bool dark,child) {
        return Scaffold(
          backgroundColor: dark? AppColor.appBlack:AppColor.appWhite,
          body: Center(child: Text("Loans",style: Font.SubTitle(color: dark? AppColor.appWhite:AppColor.appBlack),)),
        );
      }
    );
  }
}
