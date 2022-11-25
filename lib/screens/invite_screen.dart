import 'dart:collection';

import 'package:endpoint_teams_ui/helper/app_color.dart';
import 'package:endpoint_teams_ui/helper/nav_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/invite_bloc/invite_cubit.dart';
import '../bloc/invite_bloc/invite_state.dart';
import '../helper/font_style.dart';
import '../widgets/text_field_widget.dart';

class InviteScreen extends StatelessWidget {
  InviteScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();

  ValueNotifier<int> selectedTile =ValueNotifier(0);

  List<String> roles = ["Admin", "Approver", "Preparer", "Viewer", "Empoloyee"];

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppColor.darkMode.value=(MediaQuery.of(context).platformBrightness==Brightness.dark);
    return ValueListenableBuilder(
      valueListenable: AppColor.darkMode,
      builder: (context,bool dark,child) {
        return Scaffold(
          backgroundColor: dark? AppColor.appBlack:AppColor.appWhite,
          body: BlocBuilder<InviteCubit, InviteState>(
          builder: (context, state) {
           return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              back(LinkedHashMap());
                            },
                            child: SvgPicture.asset(
                              "assets/images/back.svg",
                              height: 25,
                              width: 25,
                              color: dark? AppColor.appWhite: AppColor.appBlack,
                            ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Invite",
                            style: Font.heeboTitle(color: dark? AppColor.appWhite: AppColor.appBlack,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Form(
                            key: _key,
                            child: TextFieldBox(
                              dark: dark,
                              labelText: "Business email",
                              controller: email,
                              validate: (value){
                                if(isEmailValid(value!)){
                                  return "Enter Valid Email";
                                }else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            bottomSheet(context);
                          },
                          child: ValueListenableBuilder(
                            valueListenable: selectedTile,
                            builder: (context,int index,child) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 17, bottom: 17, left: 12, right: 12),
                                  decoration: BoxDecoration(
                                      color: dark? AppColor.inviteColorDark: AppColor.appTextBackgroud,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${roles[index]}",
                                        style: Font.otherTitle(
                                            color: AppColor.appTextGrey),
                                      ),
                                      SvgPicture.asset("assets/images/down.svg")
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()async{
                      if(_key.currentState!.validate()){
                              var res = await context
                                  .read<InviteCubit>()
                                  .addInvite(email.text, selectedTile.value);
                              back(LinkedHashMap());
                            }
                          },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.appSkyBlue,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 3.0),
                              color: AppColor.appSkyBlue,
                              blurRadius: 7.0,
                            ),
                          ],),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: Font.notaTitle(
                                fontSize: 14.0, color: AppColor.appWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  },
),
        );
      }
    );
  }

  bool isEmailValid(String email) {
    if (email.isNotEmpty) {
      bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      return !emailValid;
    }
    return true;
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
        ),
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: AppColor.darkMode,
            builder: (context,bool dark,child) {
              return Material(
                color: dark? AppColor.appBlack: AppColor.appBackgroundGrey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                          child:
                              SvgPicture.asset("assets/images/Rectangle 294.svg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: Text(
                        "Team Roles",
                        style: Font.SubTitle(color: dark? AppColor.appWhite: AppColor.appBlack),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: selectedTile,
                      builder: (context,int selected,child) {
                        return ListView.builder(
                            itemCount: roles.length,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selected==index? AppColor.appSkyBlue.withOpacity(0.1) : dark? AppColor.inviteColorDark: AppColor.appWhite,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      selectedTile.value=index;
                                      back(LinkedHashMap());
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: AppColor.appSkyBlue,
                                    child: ListTile(
                                      hoverColor: AppColor.appSkyBlue,
                                      title: Text(
                                        roles[index],
                                        style: Font.SubTitle(color: selected==index? AppColor.appSkyBlue : AppColor.appTextGrey),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },);
                      }
                    ),
                  ],
                ),
              );
            }
          );
        });
  }

}
