class RegisterModel {
  bool? state;
  Data? data;
  List<Message>? message;

  RegisterModel({this.state, this.data, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    state = json['State'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    if (json['Message'] != null) {
      message = <Message>[];
      json['Message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['State'] = this.state;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (this.message != null) {
      data['Message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? username;
  String? password;
  String? role;
  dynamic? code;
  String? userId;
  bool? rememberMe;

  Data(
      {this.username,
        this.password,
        this.role,
        this.code,
        this.userId,
        this.rememberMe});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
    role = json['Role'];
    code = json['Code'];
    userId = json['UserId'];
    rememberMe = json['RememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Username'] = this.username;
    data['Password'] = this.password;
    data['Role'] = this.role;
    data['Code'] = this.code;
    data['UserId'] = this.userId;
    data['RememberMe'] = this.rememberMe;
    return data;
  }
}

class Message {
  String? value;
  int? code;

  Message({this.value, this.code});

  Message.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Value'] = this.value;
    data['Code'] = this.code;
    return data;
  }
}
