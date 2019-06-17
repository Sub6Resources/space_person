import 'package:space_person/repository/models/person.dart';

class NumberInSpace {
    String message;
    int number;
    List<Person> people;

    NumberInSpace({this.message, this.number, this.people});

    factory NumberInSpace.fromJson(Map<String, dynamic> json) {
      return NumberInSpace(
        message: json['message'],
        number: json['number'],
        people: List.from(json['people']).map((person) => Person.fromJson(person)).toList(),
      );
    }

}