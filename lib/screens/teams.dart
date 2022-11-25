import 'package:endpoint_teams_ui/helper/app_color.dart';
import 'package:flutter/material.dart';

import '../helper/font_style.dart';

class Teams extends StatelessWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColor.darkMode.value=(MediaQuery.of(context).platformBrightness==Brightness.dark);
    return ValueListenableBuilder(
      valueListenable: AppColor.darkMode,
      builder: (context,bool dark,child) {
        return Scaffold(
          backgroundColor: dark? AppColor.appBlack : AppColor.appWhite,
          body: Center(child: Text("Teams",style: Font.SubTitle(color: dark? AppColor.appWhite:AppColor.appBlack),)),
        );
      }
    );
  }
}
