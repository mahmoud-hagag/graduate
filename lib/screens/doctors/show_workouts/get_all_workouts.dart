import 'package:dio/dio.dart';
import 'package:graduate/models/workout_model.dart';

class GetAllWorkout {
  Future<List< WorkoutModel>> getAllWorkout() async {
    Future.delayed(const Duration(seconds: 2));
    var response = await Dio().get(
      'http://10.0.2.2:8000/api/workouts',
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
