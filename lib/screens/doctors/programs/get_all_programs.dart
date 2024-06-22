import 'package:dio/dio.dart';
import 'package:graduate/models/programs_model.dart';

class GetAllPrograms {
  Future<List<ProgramModel>> getAllPrograms() async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().get(
      'http://10.0.2.2:8000/api/programs',
    );
    List<dynamic> data = response.data['program'];
    List<ProgramModel> programs = [];
    for (int i = 0; i < data.length; i++) {
      programs.add(
        ProgramModel.fromJson(data[i]),
      );
    }
    return programs;
  }
}
