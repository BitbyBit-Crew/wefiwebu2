class UserModel {
  String? uid;
  String? matric;
  String? fullname;
  String? mobilenum;
  String? email;

  UserModel({this.uid, this.matric, this.fullname, this.mobilenum, this.email});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      matric: map['matric'],
      fullname: map['fullname'],
      mobilenum: map['mobilenum'],
      email: map['email'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'matric': matric,
      'fullname': fullname,
      'mobilenum': mobilenum,
      'email': email,
    };
  }
}
