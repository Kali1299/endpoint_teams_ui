
import 'package:endpoint_teams_ui/bloc/invite_bloc/invite_cubit.dart';
import 'package:endpoint_teams_ui/bloc/invite_bloc/invite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helper/nav_helper.dart';
import 'helper/nav_observer.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InviteCubit>(
            create: (context) => InviteCubit(InviteState(),context)),
      ],
      child: MaterialApp(
        title: 'Endpoint Teams UI',
        navigatorObservers: [NavObserver.instance],
        navigatorKey: NavObserver.navKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: route,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
