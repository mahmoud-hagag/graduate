
import 'package:dio/dio.dart';
import 'package:graduate/models/workout_model.dart';

class GetWorkoutUser {
  Future<List< WorkoutModel>>? getWorkoutUser(int idU) async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/users/showUserWorkouts',
      data: {
        'user_id': idU,
      }
    );
    List<dynamic> data = response.data['workouts'];
    List<WorkoutModel> workouts = [];
    for (int i = 0; i < data.length; i++) {
      workouts.add(
        WorkoutModel.fromJson(data[i]),
      );
    }
    return workouts;
  }
}