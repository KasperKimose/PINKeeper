import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:redux/redux.dart';

class AppLoading extends StatelessWidget{
  final Function(BuildContext build, bool isLoading) builder;

  AppLoading({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      distinct: true,
      converter: (Store<AppState> store) => isLoadingSelector(store.state),
      builder: builder,
    );
  }
}