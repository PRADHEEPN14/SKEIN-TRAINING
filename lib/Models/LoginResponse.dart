class LoginRes {
  String? message;
  bool? status;
  Data? data;
  String? token;

  LoginRes({this.message, this.status, this.data, this.token});

  LoginRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int? signupId;
  String? username;
  String? phonenumber;
  String? email;
  String? address;
  String? gender;
  String? bloodgroup;
  String? alternativePhoneNo;
  String? dob;
  String? qualification;
  String? password;

  Data(
      {this.signupId,
      this.username,
      this.phonenumber,
      this.email,
      this.address,
      this.gender,
      this.bloodgroup,
      this.alternativePhoneNo,
      this.dob,
      this.qualification,
      this.password});

  Data.fromJson(Map<String, dynamic> json) {
    signupId = json['signup_id'];
    username = json['username'];
    phonenumber = json['phonenumber'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    bloodgroup = json['bloodgroup'];
    alternativePhoneNo = json['alternative_phone_no'];
    dob = json['dob'];
    qualification = json['qualification'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signup_id'] = this.signupId;
    data['username'] = this.username;
    data['phonenumber'] = this.phonenumber;
    data['email'] = this.email;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['bloodgroup'] = this.bloodgroup;
    data['alternative_phone_no'] = this.alternativePhoneNo;
    data['dob'] = this.dob;
    data['qualification'] = this.qualification;
    data['password'] = this.password;
    return data;
  }
}
