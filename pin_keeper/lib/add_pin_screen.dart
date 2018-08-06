import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/models/pin_button.dart';
import 'package:pin_keeper/widgets/pin_button_widget.dart';

class AddPINScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add PIN"),
        ),
        body: new PINCard()
    );
  }
}

class PINCard extends StatefulWidget {

  @override
  PINCardState createState() {
    return new PINCardState();
  }
}

class PINCardState extends State<PINCard> {

  InitialCard pinCard;

  String nameOfCard = "";
  final TextEditingController controller = new TextEditingController();

  void _reset() {
    setState(() {
      initialCard.reset();
      controller.clear();
      nameOfCard = "";
    });
  }

  void _saved(){

  }

  Future<Null> _alertDialog(String header, String message) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(header),
          content: new SingleChildScrollView(
            child: new Text(message)
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    pinCard = initialCard;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextField(
          decoration: new InputDecoration(
              labelText: 'Name of your card',
              icon: new Icon(Icons.credit_card)),
          controller: controller,
          onChanged: (String text){
            nameOfCard = text;
          },
        ),
        new Container(
          alignment: Alignment.center,
          child: GridView.count(
            padding: const EdgeInsets.all(10.0),
            crossAxisCount: 4,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            children: pinCard.get().map((button) {
              return PINButtonWidget(
                model: button,
                onTap: () {
                },
                number: button.number,
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(8.0),
              child: new FloatingActionButton(
                onPressed: _reset,
                heroTag: 'Reset',
                tooltip: 'Reset the pin card',
                child: new Icon(Icons.refresh),
              ),
            ),
            new Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8.0),
                child: new FloatingActionButton(
                  onPressed: () => _saved(),
                  heroTag: 'Save',
                  tooltip: "Save card",
                  child: new Icon(Icons.done),
                )),
          ],
        ),
      ],
    );
  }
}
