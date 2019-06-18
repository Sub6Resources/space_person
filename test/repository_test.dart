import 'package:flutter_test/flutter_test.dart';
import 'package:space_person/repository/models/number.dart';
import 'package:space_person/repository/models/person_details.dart';
import 'package:space_person/repository/spaceperson_service.dart';
import 'package:space_person/repository/spacepersondetail_service.dart';

void main() {
  test("Test astros.json endpoint", () async {
    SpacePersonRepository spacePersonRepository = TestSpacePersonRepository();

    NumberInSpace numberInSpace =
        await spacePersonRepository.getNumberOfPeople();
    expect(numberInSpace.people.isNotEmpty, equals(true));
    expect(numberInSpace.message, equals("success"));
    expect(numberInSpace.number, greaterThan(0));
  });

  test("Test wikipedia endpoint", () async {
    SpacePersonDetailRepository spacePersonDetailRepository =
        TestSpacePersonDetailRepository();
    PersonDetails personDetails =
        await spacePersonDetailRepository.getPersonDetails("Scott Kelly");

    expect(personDetails.title, isNotEmpty);
    expect(personDetails.pageExtract, isNotEmpty);
    expect(personDetails.thumbnailImage, isNotEmpty);
  });
}

class TestSpacePersonRepository implements SpacePersonRepository {
  Map<String, dynamic> testJson = {
    "message": "success",
    "number": 1,
    "people": [
      {
        "name": "Scott Kelly",
        "craft": "ISS",
      },
    ],
  };

  Future<NumberInSpace> getNumberOfPeople() async {
    return NumberInSpace.fromJson(testJson);
  }
}

class TestSpacePersonDetailRepository implements SpacePersonDetailRepository {
  Map<String, dynamic> testResponse = {
    "batchcomplete": "",
    "continue": {"gsroffset": 1, "continue": "gsroffset||"},
    "query": {
      "pages": {
        "614906": {
          "pageid": 614906,
          "ns": 0,
          "title": "Scott Kelly (astronaut)",
          "index": 1,
          "thumbnail": {
            "source":
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Scott_J._Kelly.jpg/80px-Scott_J._Kelly.jpg",
            "width": 80,
            "height": 100
          },
          "pageimage": "Scott_J._Kelly.jpg",
          "extract":
              "<p><b>Scott Joseph Kelly</b> (born February 21, 1964; CAPT, USN, Ret.) is an engineer, a retired American astronaut, and a retired U.S. Navy captain. A veteran of four space flights, Kelly commanded the International Space Station (ISS) on Expeditions 26, 45, and 46.\n</p>"
        }
      }
    }
  };

  Future<PersonDetails> getPersonDetails(String name) async {
    return PersonDetails.fromJson(testResponse);
  }
}
