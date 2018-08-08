import 'package:flutter/material.dart';
import 'package:pin_keeper/helpers/keys.dart';
import 'package:pin_keeper/models/creditcard.dart';

class CreditCardItem extends StatelessWidget{

  final CreditCard card;
  final GestureTapCallback onTap;
  final DismissDirectionCallback onDismiss;

  CreditCardItem({
    @required this.card,
    @required this.onTap,
    @required this.onDismiss
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key:  Keys.cardItem(card.id),
      onDismissed: onDismiss,
        child: ListTile(
          onTap: onTap,
          title: Hero(
            tag: '${card.id}__heroTag',
            child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              card.name,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      )
    );
  }
}