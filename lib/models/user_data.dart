class AuthData {
  bool success;
  UserData data;
  String message;

  AuthData({this.success, this.data, this.message});

  AuthData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  String _token;
  String _name;

  UserData({String token, String name}) {
    this._token = token;
    this._name = name;
  }

  String get token => _token;
  String get name => _name;

  UserData.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    data['name'] = this._name;
    return data;
  }
}
