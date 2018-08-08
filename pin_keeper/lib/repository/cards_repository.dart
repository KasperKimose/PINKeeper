import 'dart:async';
import 'dart:core';

import 'package:pin_keeper/repository/credit_card_entity.dart';

/// A class that Loads and Persists cards. The data layer of the app.
///
/// How and where it stores the entities should defined in a concrete
/// implementation.
///
/// The domain layer should depend on this abstract class, and each app can
/// inject the correct implementation depending on the environment, such as
/// web or Flutter.
abstract class CardsRepository {

  /// Loads cards first from File storage.
  Future<List<CreditCardEntity>> loadCards();

  // Persists cards to local disk.
  Future saveCards(List<CreditCardEntity> cards);
}