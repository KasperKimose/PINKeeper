import 'package:flutter/material.dart';
import 'package:pin_keeper/repository/pin_number_entity.dart';

@immutable
class PINNumber {

  final int id;
  final Color color;
  final int number;

  PINNumber({int id, Color color, int number}):
    this.id = id ?? 0,
    this.color = color ?? null,
    this.number = number ?? null;

  PINNumber copyWith({int id, Color color, int number}){
    return PINNumber(
      id: id ?? this.id,
      color: color ?? this.color,
      number: number ?? this.number
    );
  }

  PINNumber updateNumber({int id, Color color, int number}) {
    return PINNumber(
      id: this.id,
      color: this.color,
      number: this.number != null ? (this.number+1) % 10 : 0
    );
  }

  static PINNumber fromEntity(PINNumberEntity n) {
    return PINNumber(
        id: n.id,
        color: n.color,
        number: n.number
    );
  }

  PINNumberEntity toEntity() {
    return PINNumberEntity(
        id,
        color,
        number
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINNumber && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id, number=$number)";
}