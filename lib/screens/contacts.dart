import 'package:endpoint_teams_ui/bloc/invite_bloc/invite_cubit.dart';
import 'package:endpoint_teams_ui/bloc/invite_bloc/invite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../model/invite_list.dart';
import '../helper/app_color.dart';
import '../helper/font_style.dart';
import '../helper/nav_helper.dart';
import '../model/invite_list.dart';

class Contacts extends StatelessWidget {
  Contacts({Key? key}) : super(key: key);

  int listLength = 3;

  var response;

  @override
  Widget build(BuildContext context) {
    AppColor.darkMode.value =
        (MediaQuery.of(context).platformBrightness == Brightness.dark);
    return ValueListenableBuilder(
      valueListenable: AppColor.darkMode,
      builder: (context, bool dark, child) {
        return Scaffold(
          backgroundColor:
              dark ? AppColor.appBlack : AppColor.appBackgroundGrey,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Teams",
                        style: Font.heeboTitle(
                            color:
                                dark ? AppColor.appWhite : AppColor.appBlack),
                      ),
                      SvgPicture.asset("assets/images/charm_search.svg")
                    ],
                  ),
                  Expanded(child: allPeopleDetails()),
                  Expanded(child: invitePeopleDetails()),
                ],
              ),
            ),
          ),
          floatingActionButton: InkWell(
            onTap: () {
              openScreen(inviteScreen);
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.appSkyBlue,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 3.0),
                    color: AppColor.appSkyBlue,
                    blurRadius: 7.0,
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                color: dark ? AppColor.appBlack : AppColor.appWhite,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget allPeopleDetails() {
    return ValueListenableBuilder(
        valueListenable: AppColor.darkMode,
        builder: (context, bool dark, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: BlocBuilder<InviteCubit, InviteState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All People . ${state.inviteList?.data?.contacts?.length}",
                            style: Font.SubTitle(color: AppColor.appTextGrey),
                          ),
                          Text(
                            "See all",
                            style: Font.SubTitle(color: AppColor.appSkyBlue),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: state.authState == AuthState.PROCESSING
                          ? shimmerWidget()
                          : ListView.builder(
                              itemCount:
                                  state.inviteList?.data?.contacts?.length,
                              shrinkWrap: true,
                              itemBuilder: (_, int index) {
                                var contactDetails =
                                    state.inviteList?.data?.contacts?[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: dark
                                            ? AppColor.listBackgroundDark
                                            : AppColor.appWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle),
                                    child: ListTile(
                                      leading: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        color: AppColor.allPeopleColor,
                                        child: SizedBox(
                                          height: 60,
                                          width: 50,
                                          child: Center(
                                            child: ((contactDetails!.firstname ??
                                                                "")
                                                            .length >
                                                        2 &&
                                                    (contactDetails.lastname ??
                                                                "")
                                                            .length >
                                                        2)
                                                ? Text(
                                                    (contactDetails!.firstname ??
                                                                "")
                                                            .substring(0, 1) +
                                                        (contactDetails
                                                                    .lastname ??
                                                                "")
                                                            .substring(0, 1),
                                                    style: Font.SubTitle(
                                                        color:
                                                            AppColor.appWhite),
                                                  )
                                                : Text(
                                                    (contactDetails.firstname ??
                                                                "")
                                                            .substring(0, 0) +
                                                        (contactDetails
                                                                    .lastname ??
                                                                "")
                                                            .substring(0, 0),
                                                    style: Font.SubTitle(
                                                        color:
                                                            AppColor.appWhite),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        (contactDetails!.firstname ?? "") +
                                            (contactDetails.lastname ?? ""),
                                        style: Font.SubTitle(
                                            color: dark
                                                ? AppColor.appWhite
                                                : AppColor.appBlack),
                                      ),
                                      subtitle: Text(
                                        contactDetails.isactive == true
                                            ? "Active"
                                            : "Inactive",
                                        style: Font.otherTitle(
                                            color: AppColor.appTextGrey),
                                      ),
                                      trailing: Text(
                                        contactDetails.roleName ?? "",
                                        style: Font.otherTitle(
                                            color: dark
                                                ? AppColor.appWhite
                                                : AppColor.appBlack),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget invitePeopleDetails() {
    return ValueListenableBuilder(
        valueListenable: AppColor.darkMode,
        builder: (context, bool dark, child) {
          return Padding(
            padding: EdgeInsets.only(top: 30),
            child: BlocBuilder<InviteCubit, InviteState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Invite People . ${state.inviteList?.data?.invites?.length}",
                            style: Font.SubTitle(color: AppColor.appTextGrey),
                          ),
                          Text(
                            "See all",
                            style: Font.SubTitle(color: AppColor.appSkyBlue),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: state.authState == AuthState.PROCESSING
                          ? shimmerWidget()
                          : ListView.builder(
                              itemCount:
                                  state.inviteList?.data?.invites?.length,
                              shrinkWrap: true,
                              itemBuilder: (_, int index) {
                                Invites invites =
                                    state.inviteList?.data?.invites?[index]??Invites();
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: dark
                                            ? AppColor.listBackgroundDark
                                            : AppColor.appWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle),
                                    child: ListTile(
                                      leading: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        color: AppColor.invitedColor,
                                        child: SizedBox(
                                          height: 60,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              (invites.email ?? "")
                                                  .substring(0, 1),
                                              style: Font.SubTitle(
                                                  color: AppColor.appWhite),
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        invites.email ?? "",
                                        style: Font.SubTitle(
                                            color: dark
                                                ? AppColor.appWhite
                                                : AppColor.appBlack),
                                      ),
                                      subtitle: Text(
                                        invites.configName ?? "",
                                        style: Font.otherTitle(
                                            color: AppColor.appTextGrey),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: AppColor.appWhite,
      highlightColor: AppColor.appTextGrey,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.appWhite,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle),
              child: ListTile(
                  leading: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: AppColor.appBackgroundGrey,
                    child: Container(
                      color: AppColor.appBackgroundGrey,
                      height: 60,
                      width: 50,
                      child: const Center(),
                    ),
                  ),
                  title:
                      Container(width: 50, color: AppColor.appBackgroundGrey),
                  subtitle: Container(
                    width: 50,
                    color: AppColor.appBackgroundGrey,
                  ),
                  trailing: Container(
                    width: 20,
                    color: AppColor.appBackgroundGrey,
                  )),
            ),
          );
        },
      ),
    );
  }
}
