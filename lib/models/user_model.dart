class User {
  String uid;
  String name;
  String email;
  String password;
  String about;
  String imagePath;
  bool isDarkMode;
  User({this.uid, this.name, this.email, this.password, this.about, this.imagePath, this.isDarkMode});

  User.fromMap(Map<String, dynamic> data) {
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
  User copy({
    String imagePath,
    String name,
    String email,
    String about,
    bool isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
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
