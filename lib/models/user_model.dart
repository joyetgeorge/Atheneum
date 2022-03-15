class UserModel {
  String? uid;
  String? name;
  String? email;

  UserModel({this.uid, this.email, this.name});

  //from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  //to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }
}
