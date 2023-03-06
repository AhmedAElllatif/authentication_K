class RegenerateCodeModel {
  bool? state;
  Data? data;
  List<Message>? message;

  RegenerateCodeModel({this.state, this.data, this.message});

  RegenerateCodeModel.fromJson(Map<String, dynamic> json) {
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
  String? code;
  Null? applicationUser;

  Data({this.code, this.applicationUser});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    applicationUser = json['applicationUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['applicationUser'] = this.applicationUser;
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
