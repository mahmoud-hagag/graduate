
import 'package:dio/dio.dart';
import 'package:graduate/models/workout_model.dart';

class GetWorkoutDay {
  Future<List<WorkoutModel>>? getWorkoutDay(int idD) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/days/showDayWorkouts',
      data: {
        'day_id': idD,
      }
    );
    List<dynamic> data = response.data['workouts'];
    List<WorkoutModel> programs = [];
    for (int i = 0; i < data.length; i++) {
      programs.add(
        WorkoutModel.fromJson(data[i]),
      );
    }
    return programs;
  }
}