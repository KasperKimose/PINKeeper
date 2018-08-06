import 'package:pin_keeper/models/pin_button.dart';
import 'package:pin_keeper/helpers/uuid.dart';

class CreditCard {

  final String id;
  final String name;
  final List<PINButton> numbers;

  CreditCard({String name = '', String id, List<PINButton> numbers})
    : this.name = name ?? '',
    this.id =  id ?? Uuid().generateV4(),
    this.numbers = numbers ?? [];

  Map<String, dynamic> toMap() {
    var map = new Map();
    map['name'] = name;
    return map;
  }
}