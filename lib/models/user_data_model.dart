class UserData {
  final String name;
  final String email;
  final int phone;

  UserData({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
        name: map['userame'], email: map['useremail'], phone: map['userphone']);
  }
}
