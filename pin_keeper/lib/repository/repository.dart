import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:pin_keeper/repository/cards_repository.dart';
import 'package:pin_keeper/repository/credit_card_entity.dart';
import 'package:pin_keeper/repository/file_storage.dart';


/// A class that glues together our local file storage
class CardRepositoryFlutter implements CardsRepository {

  final FileStorage fileStorage;

  const CardRepositoryFlutter({
    @required this.fileStorage,
  });

  /// Loads card first from File storage.
  @override
  Future<List<CreditCardEntity>> loadCards() async {
    try {
      return await fileStorage.loadCards();
    } catch (e) {
      return null;
    }
  }

  // Persists cards to local disk
  @override
  Future saveCards(List<CreditCardEntity> cards) {
    return Future.wait<dynamic>([
      fileStorage.saveCards(cards),
    ]);
  }
}