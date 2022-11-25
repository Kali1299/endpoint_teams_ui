class InviteList {
  String? errorFlag;
  String? message;
  Data? data;

  InviteList({this.errorFlag, this.message, this.data});

  InviteList.fromJson(Map<String, dynamic> json) {
    errorFlag = json['error_flag'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error_flag'] = errorFlag;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<Contacts>? contacts;
  List<Invites>? invites;

  Data({this.contacts, this.invites});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts?.add(Contacts.fromJson(v));
      });
    }
    if (json['invites'] != null) {
      invites = <Invites>[];
      json['invites'].forEach((v) {
        invites?.add(Invites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (contacts != null) {
      data['contacts'] = contacts?.map((v) => v.toJson()).toList();
    }
    if (invites != null) {
      data['invites'] = invites?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  String? contactId;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile;
  String? dob;
  String? contactAddressLine1;
  String? contactAddressLine2;
  String? city;
  String? countyId;
  String? countryId;
  bool? isactive;
  int? role;
  String? roleName;

  Contacts(
      {this.contactId,
        this.email,
        this.firstname,
        this.lastname,
        this.mobile,
        this.dob,
        this.contactAddressLine1,
        this.contactAddressLine2,
        this.city,
        this.countyId,
        this.countryId,
        this.isactive,
        this.role,
        this.roleName});

  Contacts.fromJson(Map<String, dynamic> json) {
    contactId = json['contact_id'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    dob = json['dob'];
    contactAddressLine1 = json['contact_address_line_1'];
    contactAddressLine2 = json['contact_address_line_2'];
    city = json['city'];
    countyId = json['county_id'];
    countryId = json['country_id'];
    isactive = json['isactive'];
    role = json['role'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['contact_id'] = contactId;
    data['email'] = email;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['contact_address_line_1'] = contactAddressLine1;
    data['contact_address_line_2'] = contactAddressLine2;
    data['city'] = city;
    data['county_id'] = countyId;
    data['country_id'] = countryId;
    data['isactive'] = isactive;
    data['role'] = role;
    data['role_name'] = roleName;
    return data;
  }
}

class Invites {
  String? inviteId;
  String? email;
  String? configName;

  Invites({this.inviteId, this.email, this.configName});

  Invites.fromJson(Map<String, dynamic> json) {
    inviteId = json['invite_id'];
    email = json['email'];
    configName = json['config_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['invite_id'] = inviteId;
    data['email'] = email;
    data['config_name'] = configName;
    return data;
  }
}