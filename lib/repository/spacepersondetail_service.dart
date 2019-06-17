import 'package:dio/dio.dart' as dio;
import 'package:space_person/repository/models/person_details.dart';

const serviceBaseURL = "https://en.wikipedia.org/w/api.php?action=query&generator=search&prop=pageimages|extracts&&gsrlimit=1&exlimit=1&pithumbsize=100&format=json&gsrsearch=";

class SpacePersonDetailService {

  Future<PersonDetails> getPersonDetails(String name) async {
    try {
      dio.Response response = await _getDio().get("$serviceBaseURL$name");
      return PersonDetails.fromJson(response.data);
    } on dio.DioError catch(error) {
      print("${error.response?.statusCode} ${error.response}");
      throw error;
    }
  }

  dio.Dio _getDio() {
    return dio.Dio();
  }
}

final spacePersonDetailService = SpacePersonDetailService();
