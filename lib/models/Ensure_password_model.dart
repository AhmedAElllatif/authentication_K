class EnsurePasswordModel {
  bool? state;
  dynamic? data;
  List<Message>? message;

  EnsurePasswordModel({this.state, this.data, this.message});

  EnsurePasswordModel.fromJson(Map<String, dynamic> json) {
    state = json['State'];
    data = json['Data'];
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
    data['Data'] = this.data;
    if (this.message != null) {
      data['Message'] = this.message!.map((v) => v.toJson()).toList();
    }
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
