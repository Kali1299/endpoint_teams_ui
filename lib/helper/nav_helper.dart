import 'dart:collection';
import 'package:endpoint_teams_ui/screens/invite_screen.dart';
import 'package:flutter/material.dart';
import '../screens/dash_board.dart';
import 'nav_observer.dart';

const String route = "/";
const String inviteScreen="/inviteScreen";

Route<Object?>? generateRoute(RouteSettings settings) {
  return getRoute(settings.name);
}

Route<Object?>? getRoute(String? name, {LinkedHashMap? args}) {
  switch (name) {
    case route:
      return MaterialPageRoute(
          builder: (context) => DashBoard(),
          settings: RouteSettings(name: name));
    case inviteScreen:
      return MaterialPageRoute(
          builder: (context) => InviteScreen(),
          settings: RouteSettings(name: name));
  }
  return null;
}

openScreen(String routeName,
    {bool forceNew = false,
    bool requiresAsInitial = false,
    LinkedHashMap? args}) {
  var route = getRoute(routeName, args: args);
  var context = NavObserver.navKey.currentContext;
  if (route != null && context != null) {
    if (requiresAsInitial) {
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else if (forceNew || !NavObserver.instance.containsRoute(route)) {
      Navigator.push(context, route);
    } else {
      Navigator.popUntil(context, (route) {
        if (route.settings.name == routeName) {
          if (args != null) {
            (route.settings.arguments as Map)["result"] = args;
          }
          return true;
        }
        return false;
      });
    }
  }
}

back(LinkedHashMap? args) {
  if (NavObserver.navKey.currentContext != null) {
    Navigator.pop(NavObserver.navKey.currentContext!, args);
  }
}
