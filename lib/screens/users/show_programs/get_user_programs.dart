
import 'package:dio/dio.dart';
import 'package:graduate/models/programs_model.dart';

class GetProgramUser {
  Future<List<ProgramModel>>? getProgramUser(int idU) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/userPrograms/showUserPrograms',
      data: {
        'user_id': idU,
      }
    );
    List<dynamic> data = response.data['programs'];
    List<ProgramModel> programs = [];
    for (int i = 0; i < data.length; i++) {
      programs.add(
        ProgramModel.fromJson(data[i]),
      );
    }
    return programs;
  }
}