class AllUser {
  String? message;
  bool? status;
  List<UserData>? data;

  AllUser({this.message, this.status, this.data});

  AllUser.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  int? signupId;
  String? username;
  String? phonenumber;
  String? email;
  String? address;
  String? gender;
  String? bloodgroup;
  String? alternativePhoneNo;
  String? dOB;
  String? qualification;
  String? password;
  String? confirmPassword;

  UserData(
      {this.signupId,
      this.username,
      this.phonenumber,
      this.email,
      this.address,
      this.gender,
      this.bloodgroup,
      this.alternativePhoneNo,
      this.dOB,
      this.qualification,
      this.password,
      this.confirmPassword});

  UserData.fromJson(Map<String, dynamic> json) {
    signupId = json['signup_id'];
    username = json['username'];
    phonenumber = json['phonenumber'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    bloodgroup = json['bloodgroup'];
    alternativePhoneNo = json['alternative_phone_no'];
    dOB = json['DOB'];
    qualification = json['qualification'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
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
    data['DOB'] = this.dOB;
    data['qualification'] = this.qualification;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
