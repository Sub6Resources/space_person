import 'package:dio/dio.dart' as dio;
import 'package:space_person/repository/models/number.dart';

const serviceBaseURL = "http://api.open-notify.org";

class SpacePersonService {
  Future<NumberInSpace> getNumberOfPeople() async {
    try {
      dio.Response response = await _getDio().get("$serviceBaseURL/astros.json");
      NumberInSpace numberInSpace = NumberInSpace.fromJson(response.data);
      return numberInSpace;
    } on dio.DioError catch(error) {
      print("${error.response.statusCode} ${error.response}");
      throw error;
    }
  }

  dio.Dio _getDio() {
    return dio.Dio();
  }
}

final spacePersonService = SpacePersonService();
