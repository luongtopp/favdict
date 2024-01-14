class User {
  int id = 0;
  String firstName = '';
  String lastName = '';

  User.empty();

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

  Map<String, dynamic> toMap() => {
        'first_name': firstName,
        'last_name': lastName,
      };
}
