class SendInvite {
  String? errorFlag;
  String? message;
  InviteResponseData? data;

  SendInvite({this.errorFlag, this.message, this.data});

  SendInvite.fromJson(Map<String, dynamic> json) {
    errorFlag = json['error_flag'];
    message = json['message'];
    data =
        json['data'] != null ? InviteResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_flag'] = errorFlag;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class InviteResponseData {
  String? inviteId;
  String? email;
  String? role;

  InviteResponseData({this.inviteId, this.email, this.role});

  InviteResponseData.fromJson(Map<String, dynamic> json) {
    inviteId = json['invite_id'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invite_id'] = inviteId;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
