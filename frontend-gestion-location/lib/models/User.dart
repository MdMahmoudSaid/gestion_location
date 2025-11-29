class User {
  final int id;
  final String email;
  final String tel;
  final String? password;

  User({
    required this.id,
    required this.email,
    required this.tel,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user_id'] ?? json['id'] ?? 0,
      email: json['email'] ?? '',
      tel: json['tel'] ?? '',
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'tel': tel,
      'password': password,
    };
  }
}
