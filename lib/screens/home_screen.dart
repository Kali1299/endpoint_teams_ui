import 'package:flutter/material.dart';

import '../helper/app_color.dart';
import '../helper/font_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColor.darkMode.value=(MediaQuery.of(context).platformBrightness==Brightness.dark);
    return ValueListenableBuilder(
      valueListenable: AppColor.darkMode,
      builder: (context,bool dark,child) {
        return Scaffold(
          backgroundColor: dark? AppColor.appBlack : AppColor.appBackgroundGrey,
          body: Center(child: Text("Home",style: Font.SubTitle(color: dark? AppColor.appWhite: AppColor.appBackgroundGrey),)),
        );
      }
    );
  }
}
