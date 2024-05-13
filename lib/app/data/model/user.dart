class User {
  final String userId;

  User(this.userId);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}
