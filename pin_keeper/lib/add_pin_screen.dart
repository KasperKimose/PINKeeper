import 'package:flutter/material.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/models/pin_button.dart';
import 'package:pin_keeper/pin_card_bloc.dart';
import 'package:pin_keeper/pin_card_provider.dart';
import 'package:pin_keeper/widgets/pin_button_widget.dart';

class AddPINScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PINCardProvider(
        pinCardBloc: PINCardBloc(),
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text("Add PIN"),
            ),
            body: new PINCard()));
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

  void _saveCard() {}

  void _reset() {
    setState(() {
      initialCard.reset();
      print("reset");
      pinCard.get().forEach(print);
      controller.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    pinCard = initialCard;
  }

  @override
  Widget build(BuildContext context) {
    final pinCardBloc = PINCardProvider.of(context);
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
                  pinCardBloc.pinNumberAddition.add(PINNumberAddition(button));
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
                  onPressed: () => pinCardBloc.numbers.forEach(print),
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
