import 'package:flutter_test/flutter_test.dart';
import 'package:space_person/shared_state/number_bloc.dart';
import 'package:space_person/shared_state/person_detail_bloc.dart';

void main() {
  test("Test number in space bloc", () {
    NumberInSpaceBloc numberInSpaceBloc = new NumberInSpaceBloc();
    expect(numberInSpaceBloc.initialState.loading, true);
    expectLater(numberInSpaceBloc.state, emitsInOrder([isA<NumberInSpaceState>(), isA<NumberInSpaceState>()]));
    numberInSpaceBloc.dispatch(NumberInSpaceEvent());
  });

  test("Test person detail bloc", () {
    PersonDetailBloc personDetailBloc = new PersonDetailBloc();
    expect(personDetailBloc.initialState.loading, true);
    expectLater(personDetailBloc.state, emitsInOrder([isA<PersonDetailState>(), isA<PersonDetailState>()]));
    personDetailBloc.dispatch(PersonDetailEvent("Scott Kelly"));
  });
}