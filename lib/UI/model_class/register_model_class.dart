class UserDetails {
  String? username;
  String? email;
  String? phoneNo;
  String? dob;
  String? password;

  UserDetails(
      {this.username, this.email, this.phoneNo, this.dob, this.password});

  UserDetails.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phoneNo = json['phone_no'];
    dob = json['dob'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['dob'] = this.dob;
    data['password'] = this.password;
    return data;
  }
}