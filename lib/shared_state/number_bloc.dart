import 'package:bloc/bloc.dart';
import 'package:space_person/repository/models/number.dart';
import 'package:space_person/repository/models/person.dart';
import 'package:space_person/repository/spaceperson_service.dart';
import 'package:dio/dio.dart';

class NumberInSpaceBloc extends Bloc<NumberInSpaceEvent, NumberInSpaceState> {
  @override
  get initialState => NumberInSpaceState(loading: true);

  @override
  Stream<NumberInSpaceState> mapEventToState(event) async* {
    try {
      NumberInSpace numberInSpace = await spacePersonRepository
          .getNumberOfPeople();
      yield NumberInSpaceState(
        numberInSpace: numberInSpace.number,
        peopleInSpace: numberInSpace.people,
      );
    } on DioError catch(error) {
      yield NumberInSpaceState(errorLoading: error.message);
    }
  }
}

class NumberInSpaceEvent {}

class NumberInSpaceState {
  final bool loading;
  final String errorLoading;

  final int numberInSpace;
  final List<Person> peopleInSpace;

  NumberInSpaceState({
    this.loading = false,
    this.errorLoading,
    this.numberInSpace,
    this.peopleInSpace,
  });
}
