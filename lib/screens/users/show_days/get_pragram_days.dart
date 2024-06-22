
import 'package:dio/dio.dart';
import 'package:graduate/models/day_model.dart';

class GetProgramDays {
  Future<List<DayModel>>? getProgramDays(int idP) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/programs/showProgramDays',
      data: {
        'program_id': idP,
      }
    );
    List<dynamic> data = response.data['days'];
    List<DayModel> days = [];
    for (int i = 0; i < data.length; i++) {
      days.add(
        DayModel.fromJson(data[i]),
      );
    }
    return days;
  }
}