class DayModel {
  final String name;
  final int id;
  DayModel( {required this.name, required this.id});

  factory DayModel.fromJson(jsonData) {
    return DayModel(
      name: jsonData['name'],
      id: jsonData['id'],
    );
  }
}
