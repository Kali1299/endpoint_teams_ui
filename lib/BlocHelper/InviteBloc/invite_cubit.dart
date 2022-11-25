
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../ApiHelper/api_helper.dart';
import 'invite_state.dart';

class InviteCubit extends Cubit<InviteState> {
  InviteCubit(super.initialState, BuildContext context){
    emit(state.copyWith(state: AuthState.PROCESSING));
    getLoginToken();
  }

   addInvite(String email, int role) async {
    var inviteResponse = await APIHelper().sendInvite(email, role);
    print(inviteResponse);
    await getAllInvite();
    return inviteResponse;
  }

 getAllInvite() async{
    emit(state.copyWith(state: AuthState.PROCESSING));
    var res = await APIHelper().getInviteList();
    emit(state.copyWith(inviteList: res,state: AuthState.SUCCESS));
  }
  void getLoginToken() async{
    var res=await APIHelper().loginApi();
    getAllInvite();
  }
}


