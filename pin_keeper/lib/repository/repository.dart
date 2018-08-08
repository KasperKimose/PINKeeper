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

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<CreditCardEntity>> loadCards() async {
    try {
      return await fileStorage.loadCards();
    } catch (e) {

      return null;
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveCards(List<CreditCardEntity> cards) {
    return Future.wait<dynamic>([
      fileStorage.saveCards(cards),
    ]);
  }
}