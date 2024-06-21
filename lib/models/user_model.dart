class UserModel {
  final String name;
  final int id;
  UserModel( {required this.name, required this.id});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      name: jsonData['firstName'],
      id: jsonData['id'],
    );
  }
}
