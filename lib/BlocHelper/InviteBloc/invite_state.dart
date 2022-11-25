import '../../Modal/invite_list.dart';

enum AuthState { UNAUTH, PROCESSING, SUCCESS, FAILED }

class InviteState {
  AuthState authState;
  InviteList? inviteList;

  InviteState({this.authState = AuthState.UNAUTH,this.inviteList});

  InviteState copyWith({AuthState? state,InviteList? inviteList}) {
    return InviteState(authState: state ?? authState,inviteList: inviteList??this.inviteList);
  }
}
