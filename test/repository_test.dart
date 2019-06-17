import 'package:flutter_test/flutter_test.dart';
import 'package:space_person/repository/models/number.dart';
import 'package:space_person/repository/models/person_details.dart';
import 'package:space_person/repository/spaceperson_service.dart';
import 'package:space_person/repository/spacepersondetail_service.dart';

void main() {
  test("Test astros.json endpoint", () async {
    NumberInSpace numberInSpace = await spacePersonService.getNumberOfPeople();
    expect(numberInSpace.people.isNotEmpty, equals(true));
    expect(numberInSpace.message, equals("success"));
    expect(numberInSpace.number, greaterThan(0));
  });

  test("Test wikipedia endpoint", () async {
    PersonDetails personDetails = await spacePersonDetailService.getPersonDetails("Scott Kelly");

    expect(personDetails.title, isNotEmpty);
    expect(personDetails.pageExtract, isNotEmpty);
    expect(personDetails.thumbnailImage, isNotEmpty);
  });
}