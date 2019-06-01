import 'package:flutter_test/flutter_test.dart';
import 'package:space_person/repository/models/number.dart';
import 'package:space_person/repository/spaceperson_service.dart';

void main() {
  test("Test astros.json endpoint", () async {
    NumberInSpace numberInSpace = await spacePersonService.getNumberOfPeople();
    expect(numberInSpace.people.isNotEmpty, equals(true));
    expect(numberInSpace.message, equals("success"));
    expect(numberInSpace.number, greaterThan(0));
  });
}