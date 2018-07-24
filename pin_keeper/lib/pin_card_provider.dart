import 'package:flutter/material.dart';
import 'package:pin_keeper/pin_card_bloc.dart';

class PINCardProvider extends InheritedWidget {
  final PINCardBloc pinCardBloc;

  PINCardProvider({
    Key key,
    @required this.pinCardBloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PINCardBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PINCardProvider) as PINCardProvider)
          .pinCardBloc;
}