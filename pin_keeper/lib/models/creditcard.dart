import 'package:pin_keeper/models/pin_number.dart';
import 'package:pin_keeper/helpers/uuid.dart';
import 'package:pin_keeper/repository/credit_card_entity.dart';

class CreditCard {

  final String id;
  final String name;
  final List<PINNumber> numbers;

  CreditCard({String name = '', String id, List<PINNumber> numbers})
    : this.name = name ?? '',
    this.id =  id ?? Uuid().generateV4(),
    this.numbers = numbers ?? [];

  Map<String, dynamic> toMap() {
    var map = new Map();
    map['name'] = name;
    return map;
  }

  static CreditCard fromEntity(CreditCardEntity e) {
    List<PINNumber> numbers = e.numbers.map((n) => PINNumber.fromEntity(n)).toList();
    return CreditCard(
      id: e.id,
      name: e.name,
      numbers: numbers
    );
  }

  CreditCardEntity toEntity(){

    return CreditCardEntity(
      id,
      name,
      numbers.map((n) => n.toEntity()).toList()
    );
  }
}