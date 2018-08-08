import 'package:flutter/material.dart';
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
        //TODO: Implement child
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