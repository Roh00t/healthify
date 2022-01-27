class User {
  String uid;
  String name;
  String email;
  String password;
  User({this.uid, this.name, this.email, this.password});

  User.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    email = data['email'];
    password = data['password'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
