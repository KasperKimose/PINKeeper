
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:pin_keeper/repository/reactive_cards_repository.dart';
import 'package:pin_keeper/repository/credit_card_entity.dart';

class FirebaseRepository implements ReactiveCardsRepository {
  static const String path = 'cards';

  final FirebaseDatabase firebase;

  const FirebaseRepository(this.firebase);

  @override
  Future<void> addNewCard(CreditCardEntity card) {
    firebase.reference().child(path).child(card.id).set(card.toJson());
  }

  @override
  Stream<List<CreditCardEntity>> cards() {
    return firebase.reference().child(path).onValue.map((event){
      if(event.snapshot == null || event.snapshot.value == null) return [];
      final Map<dynamic, dynamic> value = event.snapshot.value;

      final cardsMap = value.map((key, doc){
        return MapEntry(
          key,
          CreditCardEntity(
            key,
            doc['name'] ?? '',
            doc['numbers']
          ));
      });
      return cardsMap.values.toList();
    });
  }

  @override
  Future<void> deleteCard(List<String> ids) async {
    await Future.wait<void>(ids.map((id) {
      return firebase.reference().child(path).child(id).set(null);
    }));
  }
}