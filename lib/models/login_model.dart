class LoginModel {
  bool? state;
  Data? data;
  List<Message>? message;

  LoginModel({this.state, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  Token? token;
  LoginData? loginData;
  User? user;
  String? code;
  List<String>? roles;

  Data({this.token, this.loginData, this.user, this.code, this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'] != null ? new Token.fromJson(json['Token']) : null;
    loginData = json['LoginData'] != null
        ? new LoginData.fromJson(json['LoginData'])
        : null;
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    code = json['Code'];
    roles = json['Roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['Token'] = this.token!.toJson();
    }
    if (this.loginData != null) {
      data['LoginData'] = this.loginData!.toJson();
    }
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    data['Code'] = this.code;
    data['Roles'] = this.roles;
    return data;
  }
}

class Token {
  String? accessToken;
  String? tokenType;
  String? expiresIn;

  Token({this.accessToken, this.tokenType, this.expiresIn});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class LoginData {
  String? userName;
  String? password;
  bool? rememberMe;
  String? deviceId;

  LoginData({this.userName, this.password, this.rememberMe, this.deviceId});

  LoginData.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    password = json['Password'];
    rememberMe = json['RememberMe'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['RememberMe'] = this.rememberMe;
    data['deviceId'] = this.deviceId;
    return data;
  }
}

class User {
  String? userName;
  bool? emailConfirmed;
  String? passwordHash;
  dynamic? companyId;
  dynamic? departmentId;
  dynamic? department;
  int? accountType;
  dynamic? crmUserId;
  String? id;
  String? email;
  String? phoneNumber;
  dynamic? image;
  dynamic? createdBy;
  String? createdOn;
  dynamic? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  bool? isDeactivated;
  String? name;
  dynamic? deletedOn;
  dynamic? deletedBy;
  dynamic? ownerId;
  dynamic? owner;

  User(
      {this.userName,
        this.emailConfirmed,
        this.passwordHash,
        this.companyId,
        this.departmentId,
        this.department,
        this.accountType,
        this.crmUserId,
        this.id,
        this.email,
        this.phoneNumber,
        this.image,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.isDeactivated,
        this.name,
        this.deletedOn,
        this.deletedBy,
        this.ownerId,
        this.owner});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    emailConfirmed = json['EmailConfirmed'];
    passwordHash = json['PasswordHash'];
    companyId = json['Company_id'];
    departmentId = json['departmentId'];
    department = json['department'];
    accountType = json['AccountType'];
    crmUserId = json['CrmUserId'];
    id = json['Id'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    image = json['Image'];
    createdBy = json['CreatedBy'];
    createdOn = json['CreatedOn'];
    modifiedBy = json['ModifiedBy'];
    modifiedOn = json['ModifiedOn'];
    isDeleted = json['IsDeleted'];
    isDeactivated = json['IsDeactivated'];
    name = json['Name'];
    deletedOn = json['DeletedOn'];
    deletedBy = json['DeletedBy'];
    ownerId = json['OwnerId'];
    owner = json['Owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['EmailConfirmed'] = this.emailConfirmed;
    data['PasswordHash'] = this.passwordHash;
    data['Company_id'] = this.companyId;
    data['departmentId'] = this.departmentId;
    data['department'] = this.department;
    data['AccountType'] = this.accountType;
    data['CrmUserId'] = this.crmUserId;
    data['Id'] = this.id;
    data['Email'] = this.email;
    data['PhoneNumber'] = this.phoneNumber;
    data['Image'] = this.image;
    data['CreatedBy'] = this.createdBy;
    data['CreatedOn'] = this.createdOn;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedOn'] = this.modifiedOn;
    data['IsDeleted'] = this.isDeleted;
    data['IsDeactivated'] = this.isDeactivated;
    data['Name'] = this.name;
    data['DeletedOn'] = this.deletedOn;
    data['DeletedBy'] = this.deletedBy;
    data['OwnerId'] = this.ownerId;
    data['Owner'] = this.owner;
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
