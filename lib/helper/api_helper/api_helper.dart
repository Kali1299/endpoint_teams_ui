import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:endpoint_teams_ui/model/invite_list.dart';
import 'package:endpoint_teams_ui/model/login_response.dart';
import 'package:endpoint_teams_ui/model/send_invite.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'api_constants.dart';



enum Method { POST, GET, PUT, PATCH, DELETE }

class APIHelper {
  makeReq(String url, dynamic body, {Method method = Method.POST}) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final https = IOClient(httpClient);
    Uri uri = Uri.parse(url);
    Response response;
    var headers = {
      'Content-Type': 'application/json',
      'authtoken': authToken,
    };

    try {
      switch (method) {
        case Method.POST:
          response = await https.post(uri,
              headers: headers,
              body: jsonEncode(body),
              encoding: Encoding.getByName("utf-8"));
          break;
        case Method.GET:
          if (body != null &&
              body is Map &&
              body.isNotEmpty &&
              body is Map<String, dynamic>) {
            String queryString = Uri(queryParameters: body).query;
            uri = Uri.parse("$url?$queryString");
          }
          response = await https.get(uri, headers: headers);
          break;
        case Method.PUT:
          response = await https.put(uri,
              headers: headers,
              body: jsonEncode(body),
              encoding: Encoding.getByName("utf-8"));
          break;
        case Method.PATCH:
          response = await https.patch(uri,
              headers: headers,
              body: jsonEncode(body),
              encoding: Encoding.getByName("utf-8"));
          break;
        case Method.DELETE:
          response = await https.delete(uri,
              headers: headers,
              body: jsonEncode(body),
              encoding: Encoding.getByName("utf-8"));
          break;
        default:
          response = await https.post(uri,
              headers: headers,
              body: jsonEncode(body),
              encoding: Encoding.getByName("utf-8"));
      }
    } catch (e) {
      throw ApiFailure(400, e.toString());
    }
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        var message = "";
        var body = jsonDecode(response.body) as LinkedHashMap?;
        if (body != null && body.containsKey("errors")) {
          message = (body["errors"] as List)[0]["message"];
        }
        throw ApiFailure(response.statusCode, message);
      } else {
        var message = "";
        var body = jsonDecode(response.body) as LinkedHashMap?;
        if (body != null && body.containsKey("errors")) {
          message = (body["errors"] as List)[0]["message"];
        }
        throw ApiFailure(response.statusCode, message);
      }
    } else {
      throw ApiFailure(404, "");
    }
  }

  sendInvite(String email, int role) async {
    String sendInviteUrl = "$baseUrl$InviteUrl";
    var body = {
      "email": email,
      "role": role,
    };
    try {
      var inviteResponse =
          await makeReq(sendInviteUrl, body, method: Method.POST);
      return SendInvite.fromJson(inviteResponse);
    } on ApiFailure {}
  }

  getInviteList() async {
    String inviteListUrl = "$baseUrl$getInviteListUrlString";
    var transactionInfo =
        await makeReq(inviteListUrl, null, method: Method.GET);
    print(transactionInfo);
    return InviteList.fromJson(transactionInfo);
  }


  loginApi() async {
    String url = login_Api;
    var body = {
      "email": "xihoh55496@dineroa.com",
      "password": "Marlo@123",
      "returnSecureToken": true
    };
    var loginResponse = await makeReq(url, body, method: Method.POST);
    var loginResponseData = LoginResponse.fromJson(loginResponse);
    authToken = loginResponseData.idToken ?? "";
    return loginResponseData;
  }

}

class ApiFailure implements Exception {
  String message = "";
  int code = 400;

  ApiFailure(this.code, this.message);
}
