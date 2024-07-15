class User {
  String name;
  String password;
  String email;
  String phone;
  String profession;
  bool easyLogin;

  User({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.profession,
    this.easyLogin = false,
  });

  // Convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
      'profession': profession,
      'easyLogin': easyLogin,
    };
  }

  // Create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      profession: json['profession'],
      easyLogin: json['easyLogin'] ?? false,
    );
  }
}
