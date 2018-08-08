import 'package:flutter/material.dart';

class Keys {
  // Home Screens
  static final homeScreen = const Key('__homeScreen__');

  // Cards
  static final cardList = const Key('__cardList__');
  static final cardItem = (String id) => Key('CardItem__${id}');
  static final cardItemName = (String id) => Key('CardItem__${id}__Name');

  // Details Screen
  static final deleteCardButton = const Key('__deleteCardFab__');
  static final CardDetailsScreen = const Key('__cardDetailsScreen__');
  static final detailsCardItemName = Key('DetailsCard__Task');

  // Add Screen
  static final addCardScreen = const Key('__addCardScreen__');
  static final saveNewCard = const Key('__saveNewCard__');
  static final addCardFab = const Key('__addCardFab');

  // PIN Button
  static final pinButton = (int id) =>  Key('__PINButton__${id}');
  static final updatePINNumber = const Key('__updatePINNumber');

}