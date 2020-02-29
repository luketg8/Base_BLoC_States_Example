import 'package:base_bloc_states_example/blocs/events/home_event.dart';
import 'package:base_bloc_states_example/blocs/states/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventFetch) {
      yield HomeState(isFetching: true);

      yield await Future.delayed(
        Duration(seconds: 2),
        () => HomeState(name: 'Test'),
      );
    }
  }
}
