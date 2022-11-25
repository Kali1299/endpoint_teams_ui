import 'package:endpoint_teams_ui/ApiHelper/api_helper.dart';
import 'package:endpoint_teams_ui/BlocHelper/InviteBloc/invite_cubit.dart';
import 'package:endpoint_teams_ui/BlocHelper/InviteBloc/invite_state.dart';
import 'package:endpoint_teams_ui/screens/teams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_color.dart';
import 'chat.dart';
import 'contacts.dart';
import 'home_screen.dart';
import 'loans.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  final _pageController = PageController(initialPage: 0);
  final _valueNotifier = ValueNotifier<int>(0);

  void _onItemTapped(int index) async {
    _valueNotifier.value = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    AppColor.darkMode.value=(MediaQuery.of(context).platformBrightness==Brightness.dark);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          HomeScreen(),
          Loans(),
          Contacts(),
          Teams(),
          Chat()
        ],
      ),
      bottomNavigationBar: BlocBuilder<InviteCubit, InviteState>(
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: AppColor.darkMode,
              builder: (context,bool dark,child) {
                return ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (context, selectedIndex, child) {
                    return BottomNavigationBar(
                        elevation: 5,
                      selectedFontSize: 12,
                        backgroundColor: dark? AppColor.inviteColorDark : AppColor.appWhite,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                "assets/images/home_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appTextGreyDark,
                              ),
                              activeIcon: SvgPicture.asset(
                                "assets/images/home_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appSkyBlue,
                              ),
                              label: "Home"),
                          BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                "assets/images/loan_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appTextGreyDark,
                              ),
                              activeIcon: SvgPicture.asset(
                                "assets/images/loan_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appSkyBlue,
                              ),
                              label: "Loans"),
                          BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                "assets/images/contacts_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appTextGreyDark,
                              ),
                              activeIcon: SvgPicture.asset(
                                "assets/images/contacts_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appSkyBlue,
                              ),
                              label: "Contacts"),
                          BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                "assets/images/teams_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appTextGreyDark,
                              ),
                              activeIcon: SvgPicture.asset(
                                "assets/images/teams_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appSkyBlue,
                              ),
                              label: "Teams"),
                          BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                "assets/images/chat_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appTextGreyDark,
                              ),
                              activeIcon: SvgPicture.asset(
                                "assets/images/chat_icon.svg",
                                width: 25,
                                height: 25,
                                color: AppColor.appSkyBlue,
                              ),
                              label: "Chat"),
                        ],
                        currentIndex: int.parse(selectedIndex.toString()),
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: AppColor.appSkyBlue,
                        unselectedItemColor: AppColor.appTextGrey,
                        onTap: (index) {
                          _onItemTapped(index);
                        },
                    );
                  },
                );
              }
            );
          }),
    );
  }
}