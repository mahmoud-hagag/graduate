import 'package:dio/dio.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/doctor_model.dart';
import 'package:graduate/services/cache_helper.dart';

class GetAllDoctors{
  Future<List< DoctorModel>> getAllDoctors() async {
    Future.delayed(const Duration(seconds: 2));
      uId = CacheHelper.getData(key: 'uId');
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/auth/doctor/doctors',
      options: Options(
        headers: {'Authorization': 'Bearer $uId'},
      ),
      data: {},
    );
    List<dynamic> data = response.data['doctors'];
    List<DoctorModel> doctors = [];
    for (int i = 0; i < data.length; i++) {
      doctors.add(
        DoctorModel.fromJson(data[i]),
      );
    }
    return doctors;
  }
}
