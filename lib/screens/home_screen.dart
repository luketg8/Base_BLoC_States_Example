import 'package:base_bloc_states_example/blocs/events/home_event.dart';
import 'package:base_bloc_states_example/blocs/home_bloc.dart';
import 'package:base_bloc_states_example/blocs/states/home_state.dart';
import 'package:base_bloc_states_example/core/network_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

  @override
  void initState() {
    this._bloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NetworkBlocBuilder<HomeBloc, HomeState>(
            bloc: this._bloc,
            builder: (context, state) {
              if (state.name == null) {
                return RaisedButton(
                  child: Text('Fetch User'),
                  onPressed: () => this._bloc.add(HomeEventFetch()),
                );
              }

              return Text(state.name);
            }),
      ),
    );
  }
}
