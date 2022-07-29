class RegisterReq {
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
  String? confirmPassword;

  RegisterReq(
      {this.username,
      this.phonenumber,
      this.email,
      this.address,
      this.gender,
      this.bloodgroup,
      this.alternativePhoneNo,
      this.dob,
      this.qualification,
      this.password,
      this.confirmPassword});

  RegisterReq.fromJson(Map<String, dynamic> json) {
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
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
