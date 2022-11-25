
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../helper/app_color.dart';
import '../helper/font_style.dart';

class TextFieldBox extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? inputType;
  Function(String)? onChange;
  String? Function(String?)? validate;
  String labelText;
  bool? dark;
  Function()? onTap;
  List<TextInputFormatter>? inputFormat;
  FloatingLabelBehavior? floating;
  FocusNode? focusNode;
  TextFieldBox(
      {Key? key,
        this.inputFormat,
        this.labelText = "",
        this.controller,
        this.onChange,
        this.inputType,
        this.validate,
        this.onTap,
        this.floating = FloatingLabelBehavior.auto,
        this.focusNode,this.dark=false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:dark==true? AppColor.inviteColorDark: AppColor.appTextBackgroud,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,

        ),
        child: TextFormField(
          onTap: onTap,
          inputFormatters: inputFormat,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChange,
          keyboardType: inputType,
          validator: validate,
          style: Font.otherTitle(
              color: dark==true? AppColor.appWhite:AppColor.appBlack),
          cursorColor: AppColor.appBlack,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10,
                  bottom: 10),
              border: InputBorder.none,
              labelText: labelText,
              labelStyle:  Font.otherTitle(color:AppColor.appTextGrey),
              floatingLabelBehavior: floating),
        ),
      ),
    );
  }
}
