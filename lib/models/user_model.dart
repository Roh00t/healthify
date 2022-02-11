//User Model for edit profile, profile, log in, log out, register
class UserModel {
  String uid;
  String name;
  String email;
  String password;
  String about;
  String imagePath;
  bool isDarkMode;
  UserModel({this.uid, this.name, this.email, this.password, this.about, this.imagePath, this.isDarkMode});

  UserModel.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    email = data['email'];
    password = data['password'];
    about = data['about'];
    imagePath = data['imagePath'];
    isDarkMode = data['isDarkMode'];

  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'about': about,
      'imagePath': imagePath,
      'isDarkMode':isDarkMode
    };
  }
  UserModel copy({
    String imagePath,
    String name,
    String email,
    String about,
    bool isDarkMode,
  }) =>
      UserModel(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
        'isDarkMode': isDarkMode,
      };
}
