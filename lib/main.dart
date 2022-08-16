import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {

  // see:
  // https://javiercbk.github.io/json_to_dart/
  // and
  // https://www.youtube.com/watch?v=FH4ckL37LHw
  // and set a timeout here
  // https://stackoverflow.com/questions/66423978/how-can-i-get-time-of-async-function-execution

  String url = 'https://mattgarvin.com/api/pp1/user/4/';
  final response = await http.get(Uri.parse(url));

  User user = User.fromJson(jsonDecode(response.body));

  print(user.usrFirstName);
}

class User {
  int? errId;
  String? errCode;
  int? usrId;
  String? usrKey;
  String? usrFirstName;

  User({this.errId, this.errCode, this.usrId, this.usrKey, this.usrFirstName});

  User.fromJson(Map<String, dynamic> json) {
    errId = json['errId'];
    errCode = json['errCode'];
    usrId = json['usrId'];
    usrKey = json['usrKey'];
    usrFirstName = json['usrFirstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errId'] = this.errId;
    data['errCode'] = this.errCode;
    data['usrId'] = this.usrId;
    data['usrKey'] = this.usrKey;
    data['usrFirstName'] = this.usrFirstName;
    return data;
  }
}