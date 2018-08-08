
import 'package:flutter/material.dart';
import 'package:pin_keeper/containers/credit_card_details.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/presentation/credit_card_item.dart';

class CreditCardList extends StatelessWidget{

  final List<CreditCard> cards;
  final Function(CreditCard) onRemove;
  final Function(CreditCard) onUndoRemove;

  CreditCardList({
    Key key,
    @required this.cards,
    @required this.onRemove,
    @required this.onUndoRemove
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   if (cards.length != 0){
     return ListView.builder(
         itemBuilder: (BuildContext context, int index) {
           if (index.isOdd) return new Divider();

           final i = index ~/ 2;

           final creditCard = cards[i];

           return CreditCardItem(

             card: creditCard,
             onTap: () => _onCreditCardTap(context, creditCard),
             onDismiss: (direction) => _removeCreditCard(context, creditCard),
           );
         }
     );
    } else {
     return Center(
         child: Text("There is no cards in your direcory"
         )
     );
   }
  }


  void _removeCreditCard(BuildContext context, CreditCard card){
    onRemove(card);

    Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Theme.of(context).backgroundColor,
        content: Text(
          card.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () => onUndoRemove(card),
        )));
  }

  void _onCreditCardTap(BuildContext context, CreditCard card){
    Navigator
        .of(context)
        .push(MaterialPageRoute(
      builder: (_) => CreditCardDetails(id: card.id),
    ));
  }
}

