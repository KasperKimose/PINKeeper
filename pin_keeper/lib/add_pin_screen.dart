import 'package:flutter/material.dart';
import 'package:pin_keeper/models/pin_card.dart';
import 'package:pin_keeper/widgets/pin_button.dart';


class AddPINScreen extends StatefulWidget {
  AddPINScreen({Key key}) : super(key: key);

  @override
  _AddPINScreenState createState() => new _AddPINScreenState();
}

class _AddPINScreenState extends State<AddPINScreen> {

  void _saveCard() {}
  
  void _reset(){}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add PIN"),
      ),
      body: new Column(
        children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(
                labelText: 'Name of your card',
                icon: new Icon(Icons.credit_card)),
          ),
          new Container(
            alignment: Alignment.center,
            child: PINButtonGrid(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8.0),
                child: new FloatingActionButton(
                  onPressed: _reset,
                  tooltip: 'Reset the pin card',
                  child: new Icon(Icons.refresh),
                ),
              ),
              new Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(8.0),
                  child: new FloatingActionButton(
                    onPressed: _saveCard,
                    tooltip: "Save card",
                    child: new Icon(Icons.done),
                  )
              ),
            ],
          ),
        ],
      )
    );
  }
}

class PINButtonGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10.0),
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      shrinkWrap: true,
      children: pinCard.pinCard.map((button) {
        return PINButton(
          model: button,
          onTap: () {
            //TODO: Implement
          },
        );
      }).toList(),
    );
  }
}
