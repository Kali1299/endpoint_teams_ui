import 'package:endpoint_teams_ui/helper/app_color.dart';
import 'package:flutter/material.dart';

import '../helper/font_style.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppColor.darkMode,
      builder: (context,bool dark,child) {
        return Scaffold(
          backgroundColor: dark? AppColor.appBlack: AppColor.appBackgroundGrey,
          body:  Center(child: Text("Chat",style: Font.SubTitle(color: dark? AppColor.appWhite:AppColor.appBlack),),),
        );
      }
    );
  }
}
