class DoctorModel {
  final String name;
  final int id;
  DoctorModel( {required this.name, required this.id});

  factory DoctorModel.fromJson(jsonData) {
    return DoctorModel(
      name: jsonData['firstName'],
      id: jsonData['id'],
    );
  }
}