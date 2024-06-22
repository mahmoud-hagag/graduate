class ProgramModel {
  final String name;
  final int id;
  ProgramModel( {required this.name, required this.id});

  factory ProgramModel.fromJson(jsonData) {
    return ProgramModel(
      name: jsonData['name'],
      id: jsonData['id'],
    );
  }
}
