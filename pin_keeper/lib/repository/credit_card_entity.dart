import 'package:pin_keeper/models/pin_number.dart';
import 'package:pin_keeper/repository/pin_number_entity.dart';

class CreditCardEntity{
  final String id;
  final String name;
  final List<PINNumberEntity> numbers;

  CreditCardEntity(this.id, this.name, this.numbers);

  static CreditCardEntity fromJson(Map<String, Object> json){
    List<PINNumberEntity> numbers = (json['numbers'] as List)
        .map((i) => PINNumberEntity.fromJson(i)).toList();
    return CreditCardEntity(
      json['id'] as String,
      json['name'] as String,
      numbers
    );
  }

  Map<String, Object> toJson(){
    return {
      "id": id,
      "name": name,
      "numbers": numbers
    };
  }
}