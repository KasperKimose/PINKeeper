import 'package:flutter/material.dart';
import 'package:pin_keeper/containers/pin_buttons.dart';
import 'package:pin_keeper/helpers/keys.dart';
import 'package:pin_keeper/models/creditcard.dart';

class DetailScreen extends StatelessWidget{

  final CreditCard card;
  final Function onDelete;

  DetailScreen({
    Key key,
    @required this.card,
    @required this.onDelete
  });


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: new Container(
        child: GridView.count(
          childAspectRatio: 1.5 ,
          padding: const EdgeInsets.all(20.0),
          crossAxisCount: 5,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          shrinkWrap: true,
          children: card.numbers.map((button) {
            return FlatButton(
              key: Keys.pinButton(button.id),
                onPressed: null,
                disabledColor: button.color,
                disabledTextColor: Colors.black,
                child: new Text(button.number.toString())
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Delete card",
        child: Icon(Icons.delete),
        onPressed: () {
          onDelete();
          Navigator.pop(context, card);
        }
      ),
    );
  }
}