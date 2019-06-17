import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:space_person/shared_state/number_bloc.dart';
import 'package:space_person/shared_state/person_detail_bloc.dart';

void main() {
  test("Test number in space bloc", () async {
    NumberInSpaceBloc numberInSpaceBloc = new NumberInSpaceBloc();
    expect(numberInSpaceBloc.initialState, isA<NumberInSpaceState>());
    expectLater(numberInSpaceBloc.state, emitsInOrder([isA<NumberInSpaceState>()]));
    numberInSpaceBloc.dispatch(NumberInSpaceEvent());
    sleep(Duration(seconds: 5));
    numberInSpaceBloc.dispose();
  });

  test("Test person detail bloc", () async {
    PersonDetailBloc personDetailBloc = new PersonDetailBloc();
    expect(personDetailBloc.initialState, isA<PersonDetailState>());
    expectLater(personDetailBloc.state, emitsInOrder([isA<PersonDetailState>()]));
    personDetailBloc.dispatch(PersonDetailEvent("Scott Kelly"));
    sleep(Duration(seconds: 5));
    personDetailBloc.dispose();
  });
}