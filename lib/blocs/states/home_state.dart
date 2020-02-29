import 'package:base_bloc_states_example/blocs/states/base_network_state.dart';

class HomeState extends BaseNetworkState {
  final String name;

  HomeState({
    this.name,
    bool isFetching = false,
  }) : super(isFetching: isFetching);
}
