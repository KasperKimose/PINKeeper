import 'package:flutter/material.dart';
import 'package:pin_keeper/repository/pin_number_entity.dart';

@immutable
class PINNumber {

  final int id;
  final Color color;
  final int number;

  PINNumber(this.id, this.color, this.number);

  PINNumber copyWith({int id, Color color, int number}){
    return PINNumber(
      id = id ?? this.id,
      color = color ?? this.color,
      number = number ?? this.number
    );
  }

  static PINNumber fromEntity(PINNumberEntity n) {
    return PINNumber(
        n.id,
        n.color,
        n.number
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINNumber && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id, number=$number)";

  PINNumberEntity toEntity() {
    return PINNumberEntity(
      id,
      color,
      number
    );
  }
}