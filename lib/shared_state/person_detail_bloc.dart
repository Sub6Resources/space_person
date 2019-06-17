import 'package:bloc/bloc.dart';
import 'package:space_person/repository/models/person_details.dart';
import 'package:space_person/repository/spacepersondetail_service.dart';

class PersonDetailBloc extends Bloc<PersonDetailEvent, PersonDetailState> {

   @override
   get initialState => PersonDetailState(loading: true);

   @override
   Stream<PersonDetailState> mapEventToState(event) async* {
     yield initialState;

     yield PersonDetailState(personDetails: await spacePersonDetailService.getPersonDetails(event.name));
   }

}

class PersonDetailEvent {
  final String name;

  PersonDetailEvent(this.name);
}
class PersonDetailState {
  final bool loading;
  final PersonDetails personDetails;

  PersonDetailState({this.loading = false, this.personDetails});

}