import 'package:flutter_test/flutter_test.dart';
import 'package:space_person/shared_state/number_bloc.dart';

void main() {
  test("Test number in space bloc", () async {
    NumberInSpaceBloc numberInSpaceBloc = new NumberInSpaceBloc();
    expect(numberInSpaceBloc.initialState, isA<NumberInSpaceState>());
    expectLater(numberInSpaceBloc.state, emitsInOrder([isA<NumberInSpaceState>()]));
    numberInSpaceBloc.dispatch(NumberInSpaceEvent());
    numberInSpaceBloc.dispose();
  });
}